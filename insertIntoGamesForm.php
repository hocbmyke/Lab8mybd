	<html>
<head>
    <meta charset="utf-8">
    <meta name="keywords" content="Лабораторна робота, MySQL, з'єднання з базою даних">
    <meta name="description" content="Лабораторна робота. З'єднання з базою даних">
    <title>Вставка даних</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <?php
        include("showGames.php")    
    ?>

    <form action="insertIntoGames.php" method="post">
		<h3>Вставте назву гри</h3>
        <label>Назва гри</label><input name="name" type="text"><br>
		<input type="submit" value="Вставити рядок">
    </form>

</body>
</html>
