$(function() {

   /* Morris.Area({
        element: 'morris-area-chart',
        data: [{
            period: '2016 Q1',
            CY: 12666456.21,
            CC: null,
            CO: 9345320.21            
        }, {
            period: '2016 Q2',
            CY: 2778456,
            CC: 1294678,
            CO: 244341
        }, {
            period: '2016 Q3',
            CY: 4912789,
            CC: 1969876,
            CO: 501980
        }, {
            period: '2016 Q4',
            CY: 3767564,
            CC: 359789,
            CO: 56899
        }, {
            period: '2017 Q1',
            CY: 6810876,
            CC: 1914321,
            CO: 2293111
        }, {
            period: '2017 Q2',
            CY: 5670321,
            CC: 4293356,
            CO: 1881543
        }, {
            period: '2017 Q3',
            CY: 4820789,
            CC: 3795564,
            CO: 1588990
        }, {
            period: '2017 Q4',
            CY: 1507345,
            CC: 596765,
            CO: 517577
        }],
        xkey: 'period',
        ykeys: ['CY', 'CC', 'CO'],
        labels: ['CY', 'CC', 'CO'],
        pointSize: 2,
        hideHover: 'auto',
        resize: true
    });

    Morris.Donut({
        element: 'morris-donut-chart',
        data: [{
            label: "Download Sales",
            value: 12
        }, {
            label: "In-Store Sales",
            value: 30
        }, {
            label: "Mail-Order Sales",
            value: 20
        }],
        resize: true
    });*/

    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            y: '2006',
            a: 100,
            b: 90
        }, {
            y: '2007',
            a: 75,
            b: 65
        }, {
            y: '2008',
            a: 50,
            b: 40
        }, {
            y: '2009',
            a: 75,
            b: 65
        }, {
            y: '2010',
            a: 50,
            b: 40
        }, {
            y: '2011',
            a: 75,
            b: 65
        }, {
            y: '2012',
            a: 100,
            b: 90
        }],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Conacyt ', 'Concurrentes'],
        hideHover: 'auto',
        resize: true
    });
    
});
