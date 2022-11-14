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
        include("showPlatforms.php")    
    ?>

    <form action="insertIntoPlatform.php" method="post">
        <label>Назва платформ</label><input name="name" type="text"><br>
        <label>ІД платформи</label><input name="id" type="text"><br>
        <input type="submit" value="Вставити рядок">
    </form>

</body>
</html>
