<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<table class="table table-striped table-bordered">
  <tr>
    <td style="width: 50%;"><strong><?php echo $review['author']; ?></strong></td>
    <td class="text-right"><?php echo $review['date_added']; ?></td>
  </tr>
  <tr>
    <td colspan="2"><p><?php echo $review['text']; ?></p>
      <?php for ($i = 1; $i <= 5; $i++) { ?>
      <?php if ($review['rating'] < $i) { ?>
      <span class="fa fa-stack"><i class="fa fa-star off fa-stack-2x"></i></span>
      <?php } else { ?>
      <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
      <?php } ?>
      <?php } ?></td>
  </tr>
</table>

<script type="application/ld+json">
{
  "@context": "http://schema.org/",
  "@type": "Review",
  "datePublished": "<?php echo $review['date_added']; ?>",
  "itemReviewed": {
    "@type": "Thing",
    "name": "<?php echo $review['text']; ?>"
  },
  "author": {
    "@type": "Person",
    "name": "<?php echo $review['author']; ?>"
  },
  "reviewRating": {
    "@type": "Rating",
    "ratingValue": "<?php echo $review['rating']; ?>",
    "worstRating": "0",
    "bestRating": "5"
  }
}
</script>

<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
