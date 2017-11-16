package com.witkups.pozar;

public class Pomiar {
    private boolean dym;
    private double temperatura;

    public Pomiar(boolean dym, double temperatura) {
        this.dym = dym;
        this.temperatura = temperatura;
    }

    public double getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(double temperatura) {
        this.temperatura = temperatura;
    }


    public boolean isDym() {
        return dym;
    }

    public void setDym(boolean dym) {
        this.dym = dym;
    }

    public void validate() {
        System.out.println("Pali sie");
    }
}
