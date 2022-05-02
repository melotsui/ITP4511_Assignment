<html>
    <head>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>

        <script>
            $(document).ready(function () {

                $("#csv_form").submit(function (event) {
                    event.preventDefault();
                    var csv_data = jQuery("#csv_data").val();
                    var file_name = jQuery("#file_name").val();
                    jQuery.post("csv.jsp", {
                        csv_data: csv_data,
                        file_name: file_name
                    })
                })

                $("#xx").click(function () {
                    var hidden_form = [
                        '<form action="csv.jsp" method="POST">',
                        '<input type="hidden" name="csv_data" value="AA,BBB,CCCC"></input>',
                        '<input type="hidden" name="file_name" value="some.csv"></input>',
                        '</form>'
                    ].join("");
                    $(hidden_form).submit();
                    console.log("done")
                })
            })
        </script>

    </head>
    <body >
        <h2>Type the data you want to save as csv:</h2>

        <form name="csv_form" method="post" action="csv.jsp">
            <textarea name="csv_data"cols="80" rows="10"></textarea>
            <br>
            Filename:<input type="text" name="file_name" value="data.csv"/>
            <br>
            <input type="submit"/>
        </form>

        <h2>Test Simulating a hidden form with jQuery</h2>
        <input type="button" value="Using Hidden Form" id="xx"></input>
    </body>
</html>