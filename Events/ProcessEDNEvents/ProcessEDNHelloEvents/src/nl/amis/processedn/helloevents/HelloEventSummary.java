package nl.amis.processedn.helloevents;

public class HelloEventSummary {
    
    private String category;
    private Integer countEvents;
    private Float averageValue;

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategory() {
        return category;
    }

    public void setCountEvents(Integer countEvents) {
        this.countEvents = countEvents;
    }

    public Integer getCountEvents() {
        return countEvents;
    }

    public void setAverageValue(Float averageValue) {
        this.averageValue = averageValue;
    }

    public Float getAverageValue() {
        return averageValue;
    }


    public HelloEventSummary() {
        super();
    }
}
