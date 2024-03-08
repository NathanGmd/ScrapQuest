let bar_ctx = document.getElementById('bar-chart').getContext('2d');

let purple_orange_gradient = bar_ctx.createLinearGradient(0, 0, 0, 600);
purple_orange_gradient.addColorStop(0, 'orange');
purple_orange_gradient.addColorStop(1, 'purple');

let bar_chart = new Chart(bar_ctx, {
    type: 'bar',
    data: {
        labels: ["LinkedIn", "Facebook", "Instagram", "LeBonCoin", "Indeed"],
        datasets: [{
            label: '# of Votes',
            data: [80, 50, 35, 30, 24],
						backgroundColor: purple_orange_gradient,
						hoverBackgroundColor: purple_orange_gradient,
						hoverBorderWidth: 2,
						hoverBorderColor: 'purple'
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
