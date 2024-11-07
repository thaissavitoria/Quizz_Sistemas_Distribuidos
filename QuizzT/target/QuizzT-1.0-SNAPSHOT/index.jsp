<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz - Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #ffffff;
        }

        .container {
            padding: 2rem;
            border: 1px solid #ddd;
            width: 90%;
            max-width: 400px;
        }

        .title {
            text-align: center;
            color: #000;
            font-size: 2rem;
            margin-bottom: 2rem;
            font-weight: normal;
        }

        .form-group {
            margin-bottom: 1.5rem;
            text-align: center;
        }

        label {
            display: inline-block;
            margin-right: 0.5rem;
            color: #000;
        }

        input[type="text"] {
            padding: 0.5rem;
            border: 1px solid #000;
            font-size: 1rem;
        }

        input[type="submit"] {
            padding: 0.5rem 2rem;
            background: #fff;
            border: 1px solid #000;
            color: #000;
            font-size: 1rem;
            cursor: pointer;
            margin-top: 1rem;
        }

        input[type="submit"]:hover {
            background: #f5f5f5;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">Quiz</h1>
        <form name="formLogin" action="perguntas.jsp" method="get">
            <div class="form-group">
                <label>Nome:</label>
                <input type="text" name="name">
            </div>
            <div class="form-group">
                <input type="submit" name="sendButton" value="Entrar">
            </div>
        </form>
    </div>
</body>
</html>