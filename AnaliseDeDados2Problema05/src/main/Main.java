
package main;

import core.Aluno;

import java.io.IOException;
import java.util.ArrayList;

public class Main {

    public static void main(String[] args) throws IOException {
        // ArrayList<String> artistIdLocal =
        // Utils.readCSV("/home/brunobrandao/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/dadosTeste.csv");

        ArrayList<String> artistIdLocal2 = Utils
                .readCSV("/home/brunobrandao/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/AAAdadostreino.csv");
        ArrayList<String> artistIdLocal3 = Utils
                .readCSV("/home/brunobrandao/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/mdadosAlunos-treino.csv");
        // Utils.povoaAlunos(artistIdLocal);
        // Utils.calculaNotas();
        Utils.povoaAlunos(artistIdLocal2);
        Utils.calculaNotas();
        // Utils.povoaAlunos(artistIdLocal3);
        // Utils.calculaNotas();
        ArrayList<Aluno> a = Utils.getAlunos();

        for (int i = 0; i < a.size(); i++) {
            System.out.println(a.get(i).toString());
        }
        Utils.saveWords("/home/brunobrandao/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/AAfinalDadosTreino.csv");
    }
}
