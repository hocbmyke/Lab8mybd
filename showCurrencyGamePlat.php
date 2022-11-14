<html>
<head>
    <meta charset="utf-8">
    <meta name="keywords" content="Лабораторна робота, MySQL, з'єднання з базою даних">
    <meta name="description" content="Лабораторна робота. З'єднання з базою даних">
    <title>Таблиця Students</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Таблиця Students</h1>


    <?php

    $mysqli = new mysqli('localhost', 'admin', '', 'gamesdb'); // Створюємо нове підключення з назвою $mysqli за допомогою створення об'єта класу mysqli. Параметри підключення по порядку: сервер, логін, пароль, БД
    $mysqli->set_charset("utf8"); // Встановлюємо кодування utf8
    
    if (mysqli_connect_errno()) {
    printf("Підключення до сервера не вдалось. Код помилки: %s\n", mysqli_connect_error());
    exit;
    }

    /* Надсилаємо запит серверу */
    if($result = $mysqli->query('SELECT g.GameName, p.PlatformName, b.PriceValue, e.PriceCurrencyName FROM game AS g INNER JOIN gameplatform AS a INNER JOIN gameprice AS b INNER JOIN platform AS p ON g.GameId = a.GameId AND a.PlatformId = p.PlatformId INNER JOIN currency AS e ON e.PriceCurrencyId = b.PriceCurrencyId AND b.GameId = g.GameId ORDER BY `b`.`PriceValue` ASC')) {   // $mysqli - наш об'єкт, через який здійснюємо підключення, query - метод, який дозволяє виконати довільний запит

        printf("<h3>Звіт - Гра - платформа - ціна: </h3><br>");   // <br> в html - розрив рядка
        printf("<table><tr><th>Гра</th><th>Платформа</th><th>Ціна</th><th>Валюта</th></tr>");   // <br> в html - розрив рядка
        /* Вибірка результатів запиту  */
        while( $row = $result->fetch_assoc() ){ // fetch_assoc() повертає рядок із запиту у вигляді асоціативного масиву, наприклад $row = ['id'=>'1', 'pib'=>'Олександр', 'grupa'=>'ІПЗ-31']
            printf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>", $row['GameName'], $row['PlatformName'], $row['PriceValue'], $row['PriceCurrencyName']); //виводимо результат на сторінку
        };
        printf("</table>");
        /*Звільняємо пам'ять*/
        $result->close();
    }

    /*Закриваємо з'єднання*/
    $mysqli->close();
    ?>

    <br><br><br>

    <ul>
        <li><a href="showGames.php">Таблиця Games</a><br></li>
        <li><a href="showPlatforms.php">Таблиця Platforms</a><br></li>
        <li><a href="showCurrency.php">Таблиця Currency</a><br></li>
        <li><a href="index.html">На головну</a><br></li>
    </ul>
    
</body>
</html>
