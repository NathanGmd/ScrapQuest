document.addEventListener('DOMContentLoaded', function() {
  let colors = ['#FFAD77','#28a745','#333333','#c3e6cb','#dc3545','#6c757d'];

  let chLine = document.getElementById("chLine");
  let chartData = {
      labels: ["07/03", "08/03", "09/03", "10/03", "11/03", "12/03", "13/03"],
      datasets: [{
          label: '',
          data: [1000, 6000, 21000, 57000, 89123, 100000, 135263],
          backgroundColor: 'transparent',
          borderColor: colors[0],
          borderWidth: 4,
          pointBackgroundColor: colors[0],
      }]
  };
  if (chLine) {
      new Chart(chLine, {
          type: 'line',
          data: chartData,
          options: {
              scales: {
                  xAxes: [{
                      ticks: {
                          beginAtZero: false
                      }
                  }]
              },
              legend: {
                  display: false
              },
              responsive: true
          }
      });
  }
});
