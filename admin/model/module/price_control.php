<?php

class ModelModulePriceControl extends Model
{

    //Price types
    const PRICE_CONTROL_TYPE_BASE = 1;
    const PRICE_CONTROL_TYPE_OPTIONS = 2;
    const PRICE_CONTROL_TYPE_DISCOUNTS = 3;
    const PRICE_CONTROL_TYPE_ACTIONS = 4;

    //Units
    const PRICE_CONTROL_UNIT_PERCENT = 1;
    const PRICE_CONTROL_UNIT_NUMBER = 2;

    //Math actions
    const PRICE_CONTROL_ACTION_ADDICT = 1;
    const PRICE_CONTROL_ACTION_DEDUCT = 2;
    const PRICE_CONTROL_ACTION_MULTIPLY = 3;
    const PRICE_CONTROL_ACTION_DIVIDE = 4;

    public $version = '0.3.5.2';

    public function getCategories($parent_id = 0)
    {
        $query = $this->db->query("SELECT c.category_id,cd.name FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");

        return $query->rows;
    }

    public function hasChildren($parent_id)
    {
        $query = $this->db->query("SELECT c.category_id FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' LIMIT 1");
        return $query->num_rows;
    }

    public function getPriceTypes()
    {
        return array(
            self::PRICE_CONTROL_TYPE_BASE => 'text_main_price',
            self::PRICE_CONTROL_TYPE_OPTIONS => 'text_options_price',
            self::PRICE_CONTROL_TYPE_DISCOUNTS => 'text_discounts_price',
            self::PRICE_CONTROL_TYPE_ACTIONS => 'text_actions_price'
        );
    }

    public function getMathActions()
    {
        return array(
            self::PRICE_CONTROL_ACTION_ADDICT => 'text_addict',
            self::PRICE_CONTROL_ACTION_DEDUCT => 'text_deduct',
            self::PRICE_CONTROL_ACTION_MULTIPLY => 'text_multiply',
            self::PRICE_CONTROL_ACTION_DIVIDE => 'text_divide'
        );
    }

    public function updatePrices($price_types, $action, $num, $unit, $filter = array('categories', 'manufacturers', 'customer_groups'))
    {
        if (!empty($price_types)) {
            $this->clearDbData();
            switch ($unit) {
                case self::PRICE_CONTROL_UNIT_PERCENT:
                    $formule = "%price% $action (($num*%price%)/100)";
                    break;
                case self::PRICE_CONTROL_UNIT_NUMBER:
                    $formule = "%price% $action $num";
                    break;
            }
            foreach ($price_types as $price_type) {
                $query = "";
                $join_filter = "";
                $where_filter = "";

                switch ($price_type) {

                    case self::PRICE_CONTROL_TYPE_BASE:
                        $baseQuery = "SELECT DISTINCT a.product_id as product_id,a.price as price FROM `" . DB_PREFIX . "product` a";
                        if (!empty($filter['categories'])) {
                            $join_filter .= " LEFT JOIN `" . DB_PREFIX . "product_to_category` cat ON a.product_id=cat.product_id";
                            $where_filter .= "cat.category_id IN('" . implode($filter['categories'], "','") . "') AND ";
                        }
                        if (!empty($filter['manufacturers'])) {
                            $where_filter .= "a.manufacturer_id IN('" . implode($filter['manufacturers'], "','") . "') AND ";
                        }
                        $where_filter = chop($where_filter, ' AND ');
                        break;

                    case self::PRICE_CONTROL_TYPE_OPTIONS:
                        $baseQuery = "SELECT DISTINCT opt.product_id as product_id, opt.price as price, opt.product_option_value_id as type_id FROM `" . DB_PREFIX . "product_option_value` opt";
                        if (!empty($filter['categories'])) {
                            $join_filter .= " LEFT JOIN `" . DB_PREFIX . "product_to_category` cat ON cat.product_id=opt.product_id";
                            $where_filter .= "cat.category_id IN('" . implode($filter['categories'], "','") . "') AND ";
                        }
                        if (!empty($filter['manufacturers'])) {
                            $join_filter .= " LEFT JOIN `" . DB_PREFIX . "product` a ON a.product_id=opt.product_id";
                            $where_filter .= "a.manufacturer_id IN('" . implode($filter['manufacturers'], "','") . "') AND ";
                        }
                        $where_filter = chop($where_filter, ' AND ');
                        break;

                    case self::PRICE_CONTROL_TYPE_DISCOUNTS:
                        $baseQuery = "SELECT DISTINCT disc.product_id as product_id,disc.price as price, disc.product_discount_id as type_id FROM `" . DB_PREFIX . "product_discount` disc";
                        if (!empty($filter['categories'])) {
                            $join_filter .= " LEFT JOIN `" . DB_PREFIX . "product_to_category` cat ON cat.product_id=disc.product_id";
                            $where_filter .= "cat.category_id IN('" . implode($filter['categories'], "','") . "') AND ";
                        }
                        if (!empty($filter['manufacturers'])) {
                            $join_filter .= " LEFT JOIN `" . DB_PREFIX . "product` a ON a.product_id=disc.product_id";
                            $where_filter .= "a.manufacturer_id IN('" . implode($filter['manufacturers'], "','") . "') AND ";
                        }
                        if (!empty($filter['customer_groups'])) {
                            $where_filter .= "disc.customer_group_id IN('" . implode($filter['customer_groups'], "','") . "') AND ";
                        }
                        $where_filter = chop($where_filter, ' AND ');
                        break;

                    case self::PRICE_CONTROL_TYPE_ACTIONS:
                        $baseQuery = "SELECT DISTINCT spec.product_id as product_id,spec.price as price, spec.product_special_id as type_id FROM `" . DB_PREFIX . "product_special` spec";
                        if (!empty($filter['categories'])) {
                            $join_filter .= " LEFT JOIN `" . DB_PREFIX . "product_to_category` cat ON cat.product_id=spec.product_id";
                            $where_filter .= "cat.category_id IN('" . implode($filter['categories'], "','") . "') AND ";
                        }
                        if (!empty($filter['manufacturers'])) {
                            $join_filter .= " LEFT JOIN `" . DB_PREFIX . "product` a ON a.product_id=spec.product_id";
                            $where_filter .= "a.manufacturer_id IN('" . implode($filter['manufacturers'], "','") . "') AND ";
                        }
                        if (!empty($filter['customer_groups'])) {
                            $where_filter .= "spec.customer_group_id IN('" . implode($filter['customer_groups'], "','") . "') AND ";
                        }
                        $where_filter = chop($where_filter, ' AND ');
                        break;
                }
                if ($where_filter != "") {
                    $where_filter = " WHERE " . $where_filter;
                }
                $query = $baseQuery . $join_filter . $where_filter;
                $sql = $this->db->query($query);
                $rows = $sql->rows;
                $insertString = "";
                if (!empty($rows)) {
                    foreach ($rows as $row) {
                        $new_price = str_replace('%price%', $row['price'], $formule);
                        $type = $price_type;
                        $product_id = $row['product_id'];
                        $type_id = isset($row['type_id']) ? $row['type_id'] : '';
                        $price_old = $row['price'];
                        $price_edited = eval("return $new_price;");
                        $insertString .= "('" . $type_id . "','" . $type . "','" . $product_id . "','" . $price_old . "','" . $price_edited . "'),";
                    }
                    $insertString = chop($insertString, ',');
                    $this->db->query("INSERT INTO pricecontrol_data(`type_id`,`type`,`product_id`,`price_old`,`price_edited`) VALUES " . $insertString);
                }
                switch ($price_type) {
                    case self::PRICE_CONTROL_TYPE_BASE:
                        $this->db->query("UPDATE `" . DB_PREFIX . "product` a, `pricecontrol_data` b SET a.price=b.price_edited WHERE a.product_id=b.product_id AND b.type='" . $price_type . "'");
                        break;
                    case self::PRICE_CONTROL_TYPE_OPTIONS:
                        $this->db->query("UPDATE `" . DB_PREFIX . "product_option_value` a, `pricecontrol_data` b SET a.price=b.price_edited WHERE a.product_id=b.product_id AND a.product_option_value_id=b.type_id AND b.type='" . $price_type . "'");
                        break;
                    case self::PRICE_CONTROL_TYPE_DISCOUNTS:
                        $this->db->query("UPDATE `" . DB_PREFIX . "product_discount` a, `pricecontrol_data` b SET a.price=b.price_edited WHERE a.product_id=b.product_id AND a.product_discount_id=b.type_id AND b.type='" . $price_type . "'");
                        break;
                    case self::PRICE_CONTROL_TYPE_ACTIONS:
                        $this->db->query("UPDATE `" . DB_PREFIX . "product_special` a, `pricecontrol_data` b SET a.price=b.price_edited WHERE a.product_id=b.product_id AND a.product_special_id=b.type_id AND b.type='" . $price_type . "'");
                        break;
                }
            }
            return true;
        }
        return false;
    }

    public function createTable()
    {
        $query = "
          CREATE TABLE IF NOT EXISTS pricecontrol_data (
  id int(11) NOT NULL AUTO_INCREMENT,
  type_id int(11) DEFAULT NULL,
  type tinyint(4) NOT NULL,
  product_id int(11) NOT NULL,
  price_old decimal(15,4) NOT NULL DEFAULT '0.0000',
  price_edited decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (id));";
        return $this->db->query($query);
    }

    public function clearDbData()
    {
        return $this->db->query("TRUNCATE TABLE `pricecontrol_data`");
    }

    public function deleteTable()
    {
        $query = "DROP TABLE IF EXISTS `pricecontrol_data`;";
        return $this->db->query($query);
    }

    public function getVersion()
    {
        return $this->version;
    }

    public function checkData()
    {
        $sql = $this->db->query("SELECT * FROM pricecontrol_data LIMIT 1");
        if ($sql->num_rows)
            return true;
        return false;
    }

    public function restore()
    {
        $this->db->query("UPDATE `" . DB_PREFIX . "product` a, `pricecontrol_data` b SET a.price=b.price_old, b.price_old=b.price_edited,b.price_edited=b.price_old WHERE a.product_id=b.product_id AND b.type='" . self::PRICE_CONTROL_TYPE_BASE . "'");
        $this->db->query("UPDATE `" . DB_PREFIX . "product_option_value` a, `pricecontrol_data` b SET a.price=b.price_old, b.price_old=b.price_edited,b.price_edited=b.price_old WHERE a.product_id=b.product_id AND a.product_option_value_id=b.type_id AND b.type='" . self::PRICE_CONTROL_TYPE_OPTIONS . "'");
        $this->db->query("UPDATE `" . DB_PREFIX . "product_discount` a, `pricecontrol_data` b SET a.price=b.price_old, b.price_old=b.price_edited,b.price_edited=b.price_old WHERE a.product_id=b.product_id AND a.product_discount_id=b.type_id AND b.type='" . self::PRICE_CONTROL_TYPE_DISCOUNTS . "'");
        $this->db->query("UPDATE `" . DB_PREFIX . "product_special` a, `pricecontrol_data` b SET a.price=b.price_old, b.price_old=b.price_edited,b.price_edited=b.price_old WHERE a.product_id=b.product_id AND a.product_special_id=b.type_id AND b.type='" . self::PRICE_CONTROL_TYPE_ACTIONS . "'");
    }

}

?>