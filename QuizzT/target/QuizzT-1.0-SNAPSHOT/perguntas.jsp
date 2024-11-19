<%@page import="beans.Perguntas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz</title>
        <style>
            .question-container {
                margin: 20px auto;
                padding: 20px;
                max-width: 600px;
                border: 1px solid #ddd;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .options-container {
                margin: 15px 0;
            }
            .option-item {
                margin: 10px 0;
                padding: 8px;
                border: 1px solid #eee;
                border-radius: 4px;
                cursor: pointer;
            }
            .option-item:hover {
                background-color: #f5f5f5;
            }
            .submit-button {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .progress {
                text-align: center;
                margin-bottom: 20px;
                color: #666;
            }
        </style>
    </head>
    <body>
        <%
            String nickName = (String) session.getAttribute("NickName");
            if (request.getParameter("name") != null && !request.getParameter("name").trim().isEmpty()) {
                nickName = new String(request.getParameter("name").getBytes("ISO-8859-1"), "UTF-8");
                session.setAttribute("NickName", nickName);
            }
            
            Perguntas perguntas;
            Integer perguntaAtual;
            ArrayList<String> respostasUsuario;
            
            // Verifica se é a primeira vez que a página está sendo carregada
            if (session.getAttribute("perguntas") == null) {
                perguntas = new Perguntas();
                perguntaAtual = 0;
                respostasUsuario = new ArrayList<>();
                
                session.setAttribute("perguntas", perguntas);
                session.setAttribute("perguntaAtual", perguntaAtual);
                session.setAttribute("respostasUsuario", respostasUsuario);
            } else {
                perguntas = (Perguntas) session.getAttribute("perguntas");
                perguntaAtual = (Integer) session.getAttribute("perguntaAtual");
                respostasUsuario = (ArrayList<String>) session.getAttribute("respostasUsuario");
                
                String resposta = request.getParameter("resposta");
                if (resposta != null) {
                    resposta = new String(resposta.getBytes("ISO-8859-1"), "UTF-8");
                    respostasUsuario.add(request.getParameter("resposta"));
                    perguntaAtual++;
                    session.setAttribute("perguntaAtual", perguntaAtual);
                    session.setAttribute("respostasUsuario", respostasUsuario);
                }
            }
            
            // Verifica se o quiz acabou
            if (perguntaAtual >= perguntas.getPerguntas().size()) {
                // Calcula pontuação
                int pontuacao = 0;
                for (int i = 0; i < respostasUsuario.size(); i++) {
                    String respostaUsuario = respostasUsuario.get(i);
                    String respostaCorreta = perguntas.getPerguntas().get(i).getRespostaCorreta();
                    
                    if (respostaUsuario.equals(respostaCorreta)) {
                        pontuacao++;
                    }
                }

                try{
                File arquivo = new File("c:\\Dados\\Resultados.txt");     
                FileWriter fw = new FileWriter(arquivo, true);
                
                PrintWriter pw = new PrintWriter(fw);

                pw.println(nickName + ": " + pontuacao);
                    
                pw.close();
                fw.close();
            }catch(Exception e){
            e.printStackTrace();
            }

        %>
                <div class="question-container">
                    <h2>Quiz Finalizado!</h2>
                    <p>Parabéns, <%=session.getAttribute("NickName")%>!</p>
                    <p>Você acertou <%=pontuacao%> de <%=perguntas.getPerguntas().size()%> questões.</p>
                    <div align="center">
                        <a href="ranking.jsp" class="submit-button" style="text-decoration: none;">Ver ranking</a>
                    </div>
                </div>
        <%
                // Limpa a sessão após mostrar os resultados
                session.invalidate();
            } else {
                // Mostra a pergunta atual
        %>
                <div class="question-container">
                    <div class="progress">
                        Questão <%=perguntaAtual + 1%> de <%=perguntas.getPerguntas().size()%>
                    </div>
                    
                    <form name="formPergunta" action="perguntas.jsp" method="post">
                        <h3><%=perguntas.getPerguntas().get(perguntaAtual).getQuestao()%></h3>
                        
                        <div class="options-container">
                            <%
                                ArrayList<String> respostas = perguntas.getPerguntas().get(perguntaAtual).getRespostas();
                                for(String resposta : respostas) {
                            %>
                            <div class="option-item">
                                <input type="radio" name="resposta" value="<%=resposta%>" required>
                                <%=resposta%>
                            </div>
                            <%
                                }
                            %>
                        </div>
                        
                        <div align="center">
                            <input type="submit" value="<%=(perguntaAtual == perguntas.getPerguntas().size() - 1) ? "Finalizar" : "Próxima"%>" class="submit-button">
                        </div>
                    </form>
                </div>
        <%
            }
        %>
    </body>
</html>