xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/countriesReader";
(:: import schema at "Schemas/nxsd_countriesCSV.xsd" ::)
declare namespace ns2="saibot.airport/services/utility/reference";
(:: import schema at "Schemas/RawCountryService.xsd" ::)

declare namespace ref = "saibot.airport/data/reference";

declare variable $rawCountries as element() (:: schema-element(ns1:Countries) ::) external;

declare function local:func($rawCountries as element() (:: schema-element(ns1:Countries) ::)) as element() (:: schema-element(ns2:getAllCountriesResponseMessage) ::) {
    <ns2:getAllCountriesResponseMessage>
        <ns2:Countries>
            {
                for $Country in $rawCountries/ns1:Country
                return 
                <ns2:Country>
                    <ref:code>{fn:data($Country/ns1:code)}</ref:code>
                    <ref:name>{fn:data($Country/ns1:name)}</ref:name>
                    <ref:continent>{fn:data($Country/ns1:continent)}</ref:continent>
                    <ref:wikipediaReference>{fn:data($Country/ns1:wikipediaLink)}</ref:wikipediaReference></ns2:Country>
            }
        </ns2:Countries>
    </ns2:getAllCountriesResponseMessage>
};

local:func($rawCountries)