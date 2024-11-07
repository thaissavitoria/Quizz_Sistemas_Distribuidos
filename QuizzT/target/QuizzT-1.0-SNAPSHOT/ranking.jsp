<%@page import="beans.PontuacaoJogador"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ranking</title>
        <style>
            .ranking-container {
                max-width: 800px;
                margin: 30px auto;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                border-radius: 8px;
            }

            .ranking-title {
                text-align: center;
                color: #333;
                margin-bottom: 30px;
            }

            .player-row {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
                padding: 10px;
                background-color: #f9f9f9;
                border-radius: 5px;
            }

            .position {
                width: 40px;
                height: 40px;
                background-color: #4CAF50;
                color: white;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 15px;
                font-weight: bold;
            }

            .player-info {
                flex: 1;
            }

            .player-name {
                font-weight: bold;
                margin-bottom: 5px;
            }

            .progress-container {
                width: 100%;
                background-color: #ddd;
                border-radius: 10px;
                overflow: hidden;
            }

            .progress-bar {
                height: 20px;
                background-color: #4CAF50;
                text-align: center;
                color: white;
                line-height: 20px;
                transition: width 0.5s ease-in-out;
            }

            .back-button {
                display: block;
                width: 200px;
                margin: 20px auto;
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                text-align: center;
                text-decoration: none;
                border-radius: 5px;
            }

            .back-button:hover {
                background-color: #45a049;
            }

            /* Estilo especial para os três primeiros lugares */
            .player-row:nth-child(1) .position { background-color: #FFD700; }
            .player-row:nth-child(2) .position { background-color: #C0C0C0; }
            .player-row:nth-child(3) .position { background-color: #CD7F32; }
        </style>
    </head>
    <body>
        <div class="ranking-container">
            <h1 class="ranking-title">Ranking de Jogadores</h1>
            
            <%         
                try{
                ArrayList<PontuacaoJogador> scores = new ArrayList<>();
                BufferedReader br = new BufferedReader(new FileReader("‪c:\\Dados\\Resultados.txt"));
                String line;
                while ((line = br.readLine()) != null) {
                    String[] parts = line.split(": ");
                    if (parts.length == 2) {
                        scores.add(new PontuacaoJogador(
                        parts[0],
                        Integer.parseInt(parts[1])
                        ));
                    }
                }
                
                // Ordena os scores em ordem decrescente
                Collections.sort(scores, new Comparator<PontuacaoJogador>() {
                    @Override
                    public int compare(PontuacaoJogador p1, PontuacaoJogador p2) {
                        return Integer.compare(p2.getScore(), p1.getScore());
                    }
                });
                
                final int TOTAL_QUESTIONS = 5;
                
                int position = 1;
                for (PontuacaoJogador player : scores) {
                    double percentage = (player.getScore() * 100.0) / TOTAL_QUESTIONS;
            %>
            <div class="player-row">
                <div class="position"><%=position%></div>
                <div class="player-info">
                    <div class="player-name"><%=player.getName()%></div>
                    <div class="progress-container">
                        <div class="progress-bar" style="width: <%=percentage%>%">
                            <%=player.getScore()%>/<%=TOTAL_QUESTIONS%> (<%=String.format("%.1f", percentage)%>%)
                        </div>
                    </div>
                </div>
            </div>
            <%
                    position++;
                }
}catch(Exception e){
e.printStackTrace();
}
            %>
            
            <a href="index.jsp" class="back-button">Voltar ao Início</a>
        </div>
    </body>
</html>
