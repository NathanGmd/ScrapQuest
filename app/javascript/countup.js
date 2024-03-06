document.addEventListener('DOMContentLoaded', function() {
  const countupElement = document.getElementById('countup');
  let count = 0;

  const interval = setInterval(() => {
    count += 11;

    if (count >= 8000) {
      count = 8000;
      clearInterval(interval);
    }

    countupElement.textContent = count;
  }, 1);
});
