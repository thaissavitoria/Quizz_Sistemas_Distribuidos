package beans;
import java.util.*;

public final class Perguntas {
    private ArrayList<Pergunta> perguntas;

    public Perguntas() {
        this.perguntas = new ArrayList<>();  
        addPergunta(new Pergunta("Quem descobriu o Brasil?", "Cabral", "Cabral", "Napoleão", "Mozart", "Picasso"));
        addPergunta(new Pergunta("Quem pintou o famoso quadro \"Monalisa\"?", "Leonardo da Vinci", "Leonardo da Vinci", "Pablo Picasso", "Vincent van Gogh", "Claude Monet"));
        addPergunta(new Pergunta("Qual é o elemento químico representado pelo símbolo \"O\"?", "Oxigenio", "Oxigenio", "Ouro", "Ozônio", "Ósmio"));
        addPergunta(new Pergunta("Qual é o continente onde está localizado o deserto do Saara?", "Africa", "Africa", "Ásia", "Oceania", "América do Norte"));
        addPergunta(new Pergunta("Quem foi o diretor eleito nas eleições de 2024 do CEFET-MG Campus Divinópolis?", "Habib", "Habib", "Alba", "Antonio", "Daniel"));
        misturaPerguntas();
    }

    public ArrayList<Pergunta> getPerguntas() {
        return perguntas;
    }

    private void addPergunta(Pergunta p) {
        this.perguntas.add(p);
    }
    
    private void misturaPerguntas() {
        Collections.shuffle(this.perguntas);
    }
}