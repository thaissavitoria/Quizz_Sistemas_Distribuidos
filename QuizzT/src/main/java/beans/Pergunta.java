package beans;
import java.util.*;

public class Pergunta {
    private String questao;
    private ArrayList<String> respostas;
    private String respostaCorreta;
    
    public Pergunta(String questao, ArrayList<String> respostas, String respostaCorreta) {
        this.questao = questao;
        this.respostas = new ArrayList<>(respostas);
        this.respostaCorreta = respostaCorreta;
    }
    
    public Pergunta(String questao, String respostaCorreta, String resposta1, String resposta2, String resposta3, String resposta4) {
        this.questao = questao;
        this.respostaCorreta = respostaCorreta;
        this.respostas = new ArrayList<>();
        this.respostas.add(resposta1);
        this.respostas.add(resposta2);
        this.respostas.add(resposta3);
        this.respostas.add(resposta4);
        
        Collections.shuffle(this.respostas);
    }

    public void setRespostaCorreta(String respostaCorreta) {
        this.respostaCorreta = respostaCorreta;
    }

    public void setQuestao(String questao) {
        this.questao = questao;
    }

    public void setRespostas(ArrayList<String> respostas) {
        this.respostas = new ArrayList<>(respostas);
    }
    
    public String getRespostaCorreta() {
        return respostaCorreta;
    }
    
    public String getQuestao() {
        return questao;
    }

    public ArrayList<String> getRespostas() {
        return respostas;
    }    
}