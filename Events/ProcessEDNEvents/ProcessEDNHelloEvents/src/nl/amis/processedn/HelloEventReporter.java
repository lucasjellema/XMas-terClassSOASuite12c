package nl.amis.processedn;

import com.bea.wlevs.ede.api.StreamSink;

import nl.amis.processedn.helloevents.HelloEventSummary;

public class HelloEventReporter implements StreamSink {
    public void onInsertEvent(Object event) {
        if (event instanceof HelloEventSummary) {
            HelloEventSummary eventSummary = (HelloEventSummary) event;
            System.out.println("Summary received for: "+eventSummary.getCategory()
                               +" with a total count of "+eventSummary.getCountEvents() );
   
    }

    }
}
