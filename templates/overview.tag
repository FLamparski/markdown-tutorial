<div class="overview">
  <h2>Overview</h2>
  <div class="narrow card">
    <p>This page will track your progress through the tutorial. You can
      clear this data at any time by selecting 'New Session' from the
      menu.</p>
    <div each={ tiers } class="tier">
      <h3>{ name }</h3>
      <ul>
        <li class="lesson" each={ lessons }>
          <div class="lesson-status { (isComplete() && 'complete') || (isInProgress() && 'in-progress') || 'not-started' }">
            <svg if={ isComplete() } class="icon" xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48"><path d="M18 32.34L9.66 24l-2.83 2.83L18 38l24-24-2.83-2.83z"/></svg>
            <svg if={ isInProgress() } class="icon" xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48"><path d="M20 12l-2.83 2.83L26.34 24l-9.17 9.17L20 36l12-12z"/></svg>
            <svg if={ !isComplete() || !isInProgress() } class="icon" xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48"><path d="M38 6h-8.37c-.82-2.32-3.02-4-5.63-4s-4.81 1.68-5.63 4H10c-2.21 0-4 1.79-4 4v28c0 2.21 1.79 4 4 4h28c2.21 0 4-1.79 4-4V10c0-2.21-1.79-4-4-4zM24 6c1.1 0 2 .89 2 2s-.9 2-2 2-2-.89-2-2 .9-2 2-2zm4 28H14v-4h14v4zm6-8H14v-4h20v4zm0-8H14v-4h20v4z"/></svg>
          </div>
          <div class="lesson-desc">
            <h4>{ name }</h4>
            <p>{ description }</p>
          </div>
        </li>
      </ul>
    </div>
  </div>
</div>

<script type="es6">
  this.tiers = _.chain(this.lessons).groupBy('tier').map((lessons, tier) => {
    return {
      name: tier,
      lessons
    }
  });
</script>
