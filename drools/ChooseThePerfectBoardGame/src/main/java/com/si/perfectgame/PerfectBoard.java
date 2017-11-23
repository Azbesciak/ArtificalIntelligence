package com.si.perfectgame;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.drools.compiler.compiler.DroolsParserException;
import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;

import java.io.IOException;

public class PerfectBoard {
    public static void main(String[] args) throws DroolsParserException,
            IOException {
        PerfectBoard perfectBoard = new PerfectBoard();
        perfectBoard.runChoosingBestBoardGame();
    }

    public void runChoosingBestBoardGame() throws IOException,
            DroolsParserException {
        KieServices ks = KieServices.Factory.get();
        BasicConfigurator.configure();
        Logger.getLogger(PerfectBoard.class).setLevel(Level.OFF);
        KieContainer kContainer = ks.getKieClasspathContainer();
        KieSession session = kContainer.newKieSession("ksession-rules");
        session.fireAllRules();
    }
}
