package com.witkups.rodzina;

import java.util.ArrayList;
import java.util.List;

public class Osoba {
    public String imie;
    public Plec plec;
    public List<Relacja> relacje;

    public Osoba(String imie) {
        this.imie = imie;
        this.plec = Plec.NIEZNANA;
        relacje = new ArrayList<>();
    }

    public String toString() {
        return imie;
    }
}
