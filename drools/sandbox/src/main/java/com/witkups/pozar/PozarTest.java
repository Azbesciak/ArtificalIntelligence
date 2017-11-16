package com.witkups.pozar;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.drools.compiler.compiler.DroolsParserException;
import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;

import java.io.IOException;

public class PozarTest {
    public static void main(String[] args) throws DroolsParserException,
            IOException {
        PozarTest pozar = new PozarTest();
        pozar.executeHelloWorldRules();
    }

    public void executeHelloWorldRules() throws IOException,
            DroolsParserException {
        KieServices ks = KieServices.Factory.get();
        BasicConfigurator.configure();
        Logger.getLogger(PozarTest.class).setLevel(Level.OFF);
        KieContainer kContainer = ks.getKieClasspathContainer();
        KieSession session = kContainer.newKieSession("ksession-rules");
        session.fireAllRules();
        session.insert(new Straz());
        session.fireAllRules();
    }
}
