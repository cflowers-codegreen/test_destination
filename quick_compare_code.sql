--select * from espm_api_staging.data_accuracy_testing;
select distinct version_date from espm_api_staging.data_accuracy_testing;
select distinct "year ending" from espm_api_staging.data_accuracy_testing order by 1;
-- is there a date range to the data accuracy api?
select * from espm_api_staging.data_accuracy_testing;
select distinct name from espm_api_staging.data_accuracy_testing order by 1;
select * from espm_api_production.data_accuracy;

select pid, year_ending,
	alertdatacenterwithnoitmeter,
alertenergymeterentrymorethan65dayslong,
alertenergymetergap,
alertenergymeterlessthantwelvemonthsmeterdata,
alertenergymeternoassociation,
alertenergymeteroverlap,
alertnogfa,
alertnopropertyuses,
alertwastemetergap,
alertwastemeterlessthantwelvemonthsmeterdata,
alertwastemeternoassociation,
alertwastemeteroverlap,
alertwatermetergap,
alertwatermeterlessthantwelvemonthsmeterdata,
alertwatermeternoassociation,
alertwatermeteroverlap,
defaultdataflaginpropertyuses,
estimateddataflagwood,
estimatedvaluesenergy,
estimatedvalueswaste,
estimatedvalueswater,
temporarydataflaginpropertyuses,

down."alertEnergyMeterEntryMoreThan65DaysLong",
down."alertEnergyMeterGap",
down."alertEnergyMeterLessThanTwelveMonthsMeterData",
down."alertEnergyMeterNoAssociation",
down."alertEnergyMeterOverlap",
down."alertNoGFA",
down."alertNoPropertyUses",
down."alertWaterMeterGap",
down."alertWaterMeterLessThanTwelveMonthsMeterData",
down."alertWaterMeterNoAssociation",
down."alertWaterMeterOverlap",
down."defaultDataFlagInPropertyUses",
down."temporaryDataFlagInPropertyUses"

	,case when alertenergymeterentrymorethan65dayslong != alertEnergyMeterEntryMoreThan65DaysLong then 'Flag' 
		end as check_alertenergymeterentrymorethan65dayslong,
	case when alertenergymetergap != alertEnergyMeterGap then 'Flag' 
		end as check_alertenergymetergap,
	case when alertenergymeterlessthantwelvemonthsmeterdata != alertEnergyMeterLessThanTwelveMonthsMeterData then 'Flag' 
		end as check_alertenergymeterlessthantwelvemonthsmeterdata,
	case when alertenergymeternoassociation != alertEnergyMeterNoAssociation then 'Flag' 
		end as check_alertenergymeternoassociation,
	case when alertenergymeteroverlap != alertEnergyMeterOverlap then 'Flag' 
		end as check_alertenergymeteroverlap,
	case when alertnogfa != alertNoGFA then 'Flag' end as check_alertnogfa,
	case when alertnopropertyuses != alertNoPropertyUses then 'Flag' end as check_alertnopropertyuses,
	--case when alertwastemetergap != alertWaterMeterGap then 'Flag' end as check_alertwastemetergap,
	--case when alertwastemeterlessthantwelvemonthsmeterdata != alertWaterMeterLessThanTwelveMonthsMeterData then 'Flag' 
		--end as check_alertwastemeterlessthantwelvemonthsmeterdata,
	--case when alertwastemeternoassociation != alertWaterMeterNoAssociation then 'Flag' 
		--end as check_alertwastemeternoassociation,
	--case when alertwastemeteroverlap != alertWaterMeterOverlap then 'Flag' end as check_alertwastemeteroverlap,
	case when defaultdataflaginpropertyuses != defaultDataFlagInPropertyUses then 'Flag' 
		end as check_defaultdataflaginpropertyuses,
	case when temporarydataflaginpropertyuses != temporaryDataFlagInPropertyUses then 'Flag' 
		end as check_temporarydataflaginpropertyuses
from espm_api_production.data_accuracy api
inner join public.sol_reportentry_energy_star_data_accuracy down
	on api.pid = down."Property Id"
		and api.year_ending = down."Year Ending";