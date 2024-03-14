import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

export default class extends Controller {
   connect() {
     let chLine = this.element.getContext('2d');
     let colors = ['#FFAD77','#28A745','#333333','#C3E6CB','#DC3545','#6C757D'];

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

     new Chart(chLine, {
        type: 'line',
        data: chartData,
        options: {
            plugins: {
                legend: {
                  display: false
                }
              },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
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
}
