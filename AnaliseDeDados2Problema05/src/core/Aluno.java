
package core;

public class Aluno {
    private String mMatricula;
    private String mCodCurso;
    private double mTotalCad;
    private String mCodEvasao;
    private double mReprovado;
    private double mReprovadoFalta;
    private double mTrancado;
    private String mPeriodo;
    private double mMEdia;
    private double TotalNota;
    private double nR, nRf, nT;

    public double getnR() {
        return nR;
    }

    public void setnR(double d) {
        nR = d;
    }

    public double getnRf() {
        return nRf;
    }

    public void setnRf(double d) {
        nRf = d;
    }

    public double getnT() {
        return nT;
    }

    public void setnT(double d) {
        nT = d;
    }

    public Aluno(String mMatricula, String codEvasao, String mCodCurso,
            String mPeriodo, double media) {
        super();
        this.mMatricula = mMatricula;
        mCodEvasao = codEvasao;
        this.mCodCurso = mCodCurso;
        mTotalCad = 1;
        mReprovado = 0;
        mReprovadoFalta = 0;
        mTrancado = 0;
        this.mPeriodo = mPeriodo;
        mMEdia = media;
        TotalNota = media;
    }

    public double getTotalNota() {
        return TotalNota;
    }

    public void setTotalNota(double totalNota) {
        TotalNota = totalNota;
    }

    public String getmMatricula() {
        return mMatricula;
    }

    public String getmCodCurso() {
        return mCodCurso;
    }

    public double getmTotalCad() {
        return mTotalCad;
    }

    public double getmReprovado() {
        return mReprovado;
    }

    public String getmCodEvasao() {
        return mCodEvasao;
    }

    public void setmCodEvasao(String mCodEvasao) {
        this.mCodEvasao = mCodEvasao;
    }

    public void setmMatricula(String mMatricula) {
        this.mMatricula = mMatricula;
    }

    public void setmCodCurso(String mCodCurso) {
        this.mCodCurso = mCodCurso;
    }

    public void setmTotalCad(double d) {
        mTotalCad = d;
    }

    public void setmReprovado(double mReprovado) {
        this.mReprovado = mReprovado;
    }

    public void setmReprovadoFalta(double mReprovadoFalta) {
        this.mReprovadoFalta = mReprovadoFalta;
    }

    public void setmTrancado(double mTrancado) {
        this.mTrancado = mTrancado;
    }

    public void setmPeriodo(String mPeriodo) {
        this.mPeriodo = mPeriodo;
    }

    public void setmMEdia(double mMEdia) {
        this.mMEdia = mMEdia;
    }

    public double getmReprovadoFalta() {
        return mReprovadoFalta;
    }

    public double getmTrancado() {
        return mTrancado;
    }

    public String getmPeriodo() {
        return mPeriodo;
    }

    public double getmMEdia() {
        return mMEdia;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        if (mMatricula.equals(((Aluno) obj).getmMatricula())) {
            return true;
        }
        return false;
    }

    @Override
    public String toString() {
        String temp = mMatricula + " ;" + mCodCurso + " ;" + mTotalCad + " ;"
                + mReprovado + " ;" + mReprovadoFalta + " ;" + mTrancado + " ;"
                + mPeriodo + " ;" + mMEdia + " ;" + mCodEvasao;
        return temp;
    }

}
