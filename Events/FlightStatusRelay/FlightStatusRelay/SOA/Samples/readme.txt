Publish EDN Event from PL/SQL

my attempt at this time (does not work):

DECLARE
  NAMESPACE VARCHAR2(200);
  LOCAL_NAME VARCHAR2(200);
  PAYLOAD CLOB;
BEGIN
  NAMESPACE := 'saibot.airport/events/flight';
  LOCAL_NAME := 'FlightStatusUpdateEvent';
  PAYLOAD := to_clob('<eb:business-event xmlns:eb=
   "http://oracle.com/fabric/businessEvent"
   xmlns:ob="saibot.airport/events/flight">
   <eb:name>ob:FlightStatusUpdateEvent</eb:name>
   <eb:priority>5</eb:priority>
   <eb:content><FlightStatusUpdate  xmlns="saibot.airport/events/flight">
      <Carrier>OO</Carrier>
      <FlightNumber>918</FlightNumber>
      <FlightStatus>
        <TimePlanningUnit xmlns="saibot.airport/data/flight">
          <startDate xmlns="saibot.airport/data/reference">20150429</startDate>
          <HourOfDay xmlns="saibot.airport/data/reference">15</HourOfDay>
          <FiveMinuteBlock xmlns="saibot.airport/data/reference">10</FiveMinuteBlock>
        </TimePlanningUnit>
        <Status xmlns="saibot.airport/data/flight">OPEN</Status>
        <Action xmlns="saibot.airport/data/flight">GateOpen</Action>
        <CheckinCounter xmlns="saibot.airport/data/flight">45</CheckinCounter>
        <Runway xmlns="saibot.airport/data/flight"></Runway>
      </FlightStatus>
    </FlightStatusUpdate>   
    </eb:content>
    </eb:business-event>'); 
  EDN_PUBLISH_EVENT( NAMESPACE => NAMESPACE, LOCAL_NAME => LOCAL_NAME, PAYLOAD => PAYLOAD);
END;