import { Controller } from "@hotwired/stimulus";
import Chart from 'stimulus-chartjs'

export default class extends Controller {
  connect() {
    let colors = ['#FFAD77','#28A745','#333333','#C3E6CB','#DC3545','#6C757D'];
    let chLine = document.getElementById('chLine');

    const data = [
        { year: 2010, count: 10 },
        { year: 2011, count: 20 },
        { year: 2012, count: 15 },
        { year: 2013, count: 25 },
        { year: 2014, count: 22 },
        { year: 2015, count: 30 },
        { year: 2016, count: 28 },
      ];
      
    console.log("coucou")
      // new Chart(
      //   chLine,
      //   {
      //     type: 'bar',
      //     data: {
      //       labels: data.map(row => row.year),
      //       datasets: [
      //         {
      //           label: 'Acquisitions by year',
      //           data: data.map(row => row.count)
      //         }
      //       ]
      //     }
      //   }
      // );

    // let chartData = {
    //     labels: ["07/03", "08/03", "09/03", "10/03", "11/03", "12/03", "13/03"],
    //     datasets: [{
    //         label: '',
    //         data: [1000, 6000, 21000, 57000, 89123, 100000, 135263],
    //         backgroundColor: 'transparent',
    //         borderColor: colors[0],
    //         borderWidth: 4,
    //         pointBackgroundColor: colors[0],
    //     }]
    // };

    // new Chart(chLine, {
    //     type: 'line',
    //     data: chartData,
    //     options: {
    //         scales: {
    //             xAxes: [{
    //                 ticks: {
    //                     beginAtZero: false
    //                 }
    //             }]
    //         },
    //         legend: {
    //             display: false
    //         },
    //         responsive: true
    //     }
    // });
  }
}
