Class BloodTransfusion.BS.HISService Extends EnsLib.SOAP.Service
{

Parameter ADAPTER;

/// EnsLib.SOAP.Service
Parameter SERVICENAME = "HISService";

Parameter NAMESPACE = "http://myhospital.org";

Parameter USECLASSNAMESPACES = 1;

Method GetEvent(pRequest As HIP.Message.Events.HIPResourceEventMsg) As %String [ WebMethod ]
{
	set tSC = ..SendRequestAsync("HIS订阅接口流程",pRequest)
	Quit "Event Received"
}

}
