package com.witkups.rodzina;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.drools.compiler.compiler.DroolsParserException;
import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.kie.api.runtime.rule.QueryResults;

import java.io.IOException;

public class RodzinkaRun {
    public static void main(String[] args) throws DroolsParserException,
            IOException {
        RodzinkaRun rodzina = new RodzinkaRun();
        rodzina.executeRodzina();
    }

    public void executeRodzina() throws IOException,
            DroolsParserException {
        KieServices ks = KieServices.Factory.get();
        BasicConfigurator.configure();
        Logger.getLogger(RodzinkaRun.class).setLevel(Level.OFF);
        KieContainer kContainer = ks.getKieClasspathContainer();
        KieSession session = kContainer.newKieSession("ksession-rules");
        session.fireAllRules();
        final QueryResults allWujekAndStryjek = session.getQueryResults("all wujek and stryjek and ciotka");
        allWujekAndStryjek.forEach(r -> System.out.println(r.get("rel")));
        session.fireAllRules();
    }
}
