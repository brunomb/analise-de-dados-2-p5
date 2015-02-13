
package main;

import core.Aluno;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;

public class Utils {

    final static ArrayList<Aluno> alunos = new ArrayList<Aluno>();
    final static HashMap<String, Aluno> alunos2 = new HashMap<String, Aluno>();

    private static final String DADOS_ALUNOS = "/home/brunobrandao/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/dadosAlunos.csv";

    private static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
        return sb.toString();
    }

    public static ArrayList<String> readCSV(final String path) {
        final BufferedReader reader;

        final ArrayList<String> data = new ArrayList<String>();

        try {
            reader = new BufferedReader(new FileReader(path));

            String line = null;

            while ((line = reader.readLine()) != null) {
                data.add(line);
            }

            reader.close();

        } catch (final FileNotFoundException e) {
            e.printStackTrace();
        } catch (final IOException e) {
            e.printStackTrace();
        }

        return data;

    }

    public static void povoaAlunos(ArrayList<String> alunosString) {
        for (int i = 1; i < alunosString.size(); i++) {
            String[] partes = alunosString.get(i).split(";");
            String matricula = partes[7];
            String codEvasao = partes[1];
            String perido = partes[2];
            String curso = partes[0];
            String mediaS = partes[5];
            Double mediaD = 0.0;

            if (!mediaS.trim().equals("NA")) {
                mediaD = Double.parseDouble(mediaS);
            }

            String aprovado = partes[6];

            if (alunos2.containsKey(matricula)) {
                alunos2.get(matricula).setmTotalCad(
                        alunos2.get(matricula).getmTotalCad() + 1);
                alunos2.get(matricula).setTotalNota(
                        alunos2.get(matricula).getTotalNota() + mediaD);
                alunos2.get(matricula).setmMEdia(
                        alunos2.get(matricula).getTotalNota()
                                / alunos2.get(matricula).getmTotalCad());

                switch (aprovado) {
                    case "Aprovado":
                        break;
                    case "Reprovado":
                        alunos2.get(matricula).setnR(
                                alunos2.get(matricula).getnR() + 1);
                        break;
                    case "Reprovado por Falta":
                        alunos2.get(matricula).setnRf(
                                alunos2.get(matricula).getnRf() + 1);
                        break;

                    case "Trancado":
                        alunos2.get(matricula).setnT(
                                alunos2.get(matricula).getnT() + 1);
                        break;
                    default:
                        break;
                }
            } else {
                Aluno tempAluno = new Aluno(matricula, codEvasao, curso,
                        perido,
                        mediaD);
                alunos2.put(matricula, tempAluno);

                switch (aprovado) {
                    case "Aprovado":
                        break;
                    case "Reprovado":
                        alunos2.get(matricula).setnR(
                                alunos2.get(matricula).getnR() + 1);
                        break;
                    case "Reprovado por Falta":
                        alunos2.get(matricula).setnRf(
                                alunos2.get(matricula).getnRf() + 1);
                        break;

                    case "Trancado":
                        alunos2.get(matricula).setnT(
                                alunos2.get(matricula).getnT() + 1);
                        break;
                    default:
                        break;
                }
            }
        }
    }

    public static ArrayList<Aluno> getAlunos() {
        ArrayList<Aluno> a = new ArrayList<Aluno>();
        for (Aluno i : alunos2.values()) {
            a.add(i);
        }
        return a;
    }

    public static void calculaNotas() {
        for (Aluno a : alunos2.values()) {
            double div = a.getnR() / a.getmTotalCad();
            System.out.println(a.getnR() + " / " + a.getmTotalCad() + " = "
                    + div);
            a.setmReprovado(a.getnR() / a.getmTotalCad());
            a.setmReprovadoFalta(a.getnRf() / a.getmTotalCad());
            a.setmTrancado(a.getnT() / a.getmTotalCad());
        }
    }

    public static void saveWords(final String filename) throws IOException {
        PrintWriter writerAnalysis;

        writerAnalysis = new PrintWriter(new BufferedWriter(new FileWriter(
                filename, false)));

        writerAnalysis
                .println("matricula;curso;totalcadeira;reprovadonota;reprovadofalta;trancado;perido;media;codevasao");

        for (Aluno a : alunos2.values()) {
            writerAnalysis.println(a.toString());
        }
        writerAnalysis.flush();
        writerAnalysis.close();
    }

}
