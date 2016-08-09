using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace DemoWCFRest
{
	// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
	[ServiceContract]
	public interface IService1
	{
		[OperationContract]
        string getPackage(int id);

        [OperationContract]
        string getPackages();

        [OperationContract]
        [WebInvoke(Method ="GET",ResponseFormat = WebMessageFormat.Json,BodyStyle =WebMessageBodyStyle.Bare,UriTemplate = "DoWork")]
        string DoWork(int value);

        [OperationContract]
        [WebInvoke(Method ="POST",ResponseFormat = WebMessageFormat.Json,BodyStyle =WebMessageBodyStyle.Bare,UriTemplate = "DoSquare")]
        int DoSquare(int value);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare, UriTemplate = "DoAdd")]
        int DoAdd(AddValues value);

        [OperationContract]
        CompositeType GetDataUsingDataContract(CompositeType composite);

        // TODO: Add your service operations here
    }

    [DataContract]
    public class AddValues
    {
        [DataMember]
        public int value1 { get; set; }
        [DataMember]
        public int value2 { get; set; }

        public AddValues()
        {
            value1 = 0;
            value2 = 0;
        }

    }

    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    [DataContract]
    public class CompositeType
    {
        bool boolValue = true;
        string stringValue = "Hello ";

        [DataMember]
        public bool BoolValue
        {
            get { return boolValue; }
            set { boolValue = value; }
        }

        [DataMember]
        public string StringValue
        {
            get { return stringValue; }
            set { stringValue = value; }
        }
    }
}
