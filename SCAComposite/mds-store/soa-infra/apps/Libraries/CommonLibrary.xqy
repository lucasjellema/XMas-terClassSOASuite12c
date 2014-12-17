xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

module namespace ams="http://xmlns.amis.nl/query-functions";

declare function ams:sayHello($name as xs:string) as xs:string {
    fn:concat("Hello ", $name)
};
