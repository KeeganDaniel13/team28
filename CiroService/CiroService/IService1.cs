using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using CiroService.EFDatabase;

using CiroService.JsonObjects;
using System.Web.Http;
using System.IO;


namespace CiroService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    /// <summary>
    /// Interface IService1
    /// </summary>
    [ServiceContract]
    public interface IService1
    {

        /// <summary>
        /// Gets the users.
        /// </summary>
        /// <returns>IEnumerable&lt;JsonUser&gt;.</returns>
        [WebGet(UriTemplate = "users", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        IEnumerable <JsonUser> GetUsers();

        /// <summary>
        /// Gets the data.
        /// </summary>
        /// <returns>System.String.</returns>
        [WebGet(UriTemplate = "data/{id}", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        string GetData(string id);

        /// <summary>
        /// Logins the specified login.
        /// </summary>
        /// <param name="login">The login.</param>
        /// <returns>JsonUser.</returns>
        [OperationContract]
        //[WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Bare, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "login")]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "login")]
        JsonUser login(jsonLoginUser login);

        /// <summary>
        /// Clients the products.
        /// </summary>
        /// <param name="user">The user.</param>
        /// <returns>IEnumerable&lt;jsonProduct&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "clientProducts")]
        IEnumerable<jsonProduct> clientProducts(JsonUser user);

        /// <summary>
        /// Lists the transfer t requests.
        /// </summary>
        /// <returns>IEnumerable&lt;TransferDetails&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "listRequests")]
        IEnumerable<TransferDetails> listTransferTRequests();

        /// <summary>
        /// Transefers the request.
        /// </summary>
        /// <param name="newRequest">The new request.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "transferrequest")]
        string transeferRequest(IEnumerable<jsonTRequest> newRequest);

        //Complete
        /// <summary>
        /// Transfers the list.
        /// </summary>
        /// <returns>IEnumerable&lt;TransferDetails&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, UriTemplate = "transferlist")]
        IEnumerable<TransferDetails> transferList();

        //Complete
        /// <summary>
        /// Stocks the take.
        /// </summary>
        /// <param name="stockTake">The stock take.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "stockTake")]
        string stockTake(stockTakeInfo stockTake);

        /// <summary>
        /// Stocks the add.
        /// </summary>
        /// <param name="origin">The origin.</param>
        /// <param name="newProduct">The new product.</param>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "stockAdd")]
        void stockAdd(string origin, IEnumerable<jsonProduct> newProduct);

        //TaskList Warehouse Manager
        //To complete
        /// <summary>
        /// Tasks the list.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>IEnumerable&lt;jsonTask&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "tasks/{id}")]
        IEnumerable<JsonTask> taskList(string id);

        //Report incident
        //Todo
        //accept 
        /// <summary>
        /// Adds the incident.
        /// </summary>
        /// <param name="newIncident">The new incident.</param>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addincident")]
        void addIncident(jsonIncident newIncident);

        //return warehouse information
        //todo
        /// <summary>
        /// Warehouses the information.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>JsonWarehouse.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "warehouseInfo/{id}")]
        JsonWarehouse warehouseInfo(string id);

        //return list of warehouses
        //todo
        /// <summary>
        /// Warehouseses this instance.
        /// </summary>
        /// <returns>IEnumerable&lt;JsonWarehouse&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "warehouseInfo")]
        IEnumerable<JsonWarehouse> warehouses();


        //Now 
        //Stock take
        /// <summary>
        /// Stockleavings the warehouse.
        /// </summary>
        /// <param name="location">The location.</param>
        /// <returns>IEnumerable&lt;transferStock&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "stockleaving/{location}")]
        IEnumerable<transferStock> stockleavingWarehouse(string location);
        //Still needed and implementation
        //Notification
        //messages
        //Pendingtansfer
        //warehouse condition
        //warehouse transaction history

        /// <summary>
        /// Registers the specified reg user.
        /// </summary>
        /// <param name="regUser">The reg user.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "register")]
        string register(JsonUser regUser);

        /// <summary>
        /// Updates the user.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="updateUsr">The update usr.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "updateUser/{id}")]
        string updateUser(string id, JsonUser updateUsr);

        /// <summary>
        /// Gets the package identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>JsonProducts.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getPackageID/{id}")]
        JsonProducts getPackageID(string id);

        /// <summary>
        /// Gets the type of the package.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <returns>IEnumerable&lt;JsonProducts&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getPackageType/{type}")]
        IEnumerable<JsonProducts> getPackageType(string type);

        /// <summary>
        /// Gets the package owner.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>IEnumerable&lt;JsonProducts&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getPackageOwner/{id}")]
        IEnumerable<JsonProducts> getPackageOwner(string id);

        /// <summary>
        /// Gets the package date.
        /// </summary>
        /// <param name="date">The date.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getPackageDate/{date}")]
        string getPackageDate(string date);

        /// <summary>
        /// Gets the package dest.
        /// </summary>
        /// <param name="dest">The dest.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getPackageDest/{dest}")]
        string getPackageDest(string dest);

        /// <summary>
        /// Gets the package location.
        /// </summary>
        /// <param name="location">The location.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getPackageLocation/{location}")]
        string getPackageLocation(string location);

        /// <summary>
        /// Adds the package.
        /// </summary>
        /// <param name="prod">The product.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addPackage")]
        string addPackage(JsonProducts prod);

        /// <summary>
        /// Updates the package.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="prod">The product.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "updatePackage/{id}")]
        string updatePackage(string id, JsonProducts prod);

        /// <summary>
        /// Updates the package w location.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="location">The location.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "updatePackageWLocation/{id}")]
        string updatePackageWLocation(string id, string location);

        /// <summary>
        /// Releases the request.
        /// </summary>
        /// <param name="owner">The owner.</param>
        /// <param name="product">The product.</param>
        /// <param name="description">The description.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "releaseRequest/{description}")]
        string releaseRequest(JsonUser owner, jsonProduct product, string description);

        /// <summary>
        /// Gets the release.
        /// </summary>
        /// <param name="user">The user.</param>
        /// <returns>IEnumerable&lt;JsonReleaseRequest&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getRelease")]
        IEnumerable<JsonReleaseRequest> getRelease(JsonUser user);

        /// <summary>
        /// Gets the release requests.
        /// </summary>
        /// <returns>IEnumerable&lt;JsonReleaseRequest&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getReleaseRequests")]
        IEnumerable<JsonReleaseRequest> getReleaseRequests();

        /// <summary>
        /// Adds the product log.
        /// </summary>
        /// <param name="code">The code.</param>
        /// <param name="productlog">The productlog.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addProductLog/{code}")]
        string addProductLog(string code, JsonProductLog productlog);

        /// <summary>
        /// Gets the product log.
        /// </summary>
        /// <param name="product">The product.</param>
        /// <returns>IEnumerable&lt;JsonProductLog&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getProductLog")]
        IEnumerable<JsonProductLog> getProductLog(jsonProduct product);

        /// <summary>
        /// Gets the warehouse.
        /// </summary>
        /// <returns>IEnumerable&lt;JsonWarehouse&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getWarehouse")]
        IEnumerable<JsonWarehouse> getWarehouse();

        /// <summary>
        /// Approves the transfer.
        /// </summary>
        /// <param name="product">The product.</param>
        /// <param name="verdict">The verdict.</param>
        /// <param name="description">The description.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "approveTransfer")]
        string approveTransfer(jsonProduct product, string verdict, string description);

        /// <summary>
        /// Approves the request.
        /// </summary>
        /// <param name="verdict">The verdict.</param>
        /// <param name="prod">The product.</param>
        /// <param name="description">The description.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "approveRequest")]
        string approveRequest(string verdict, JsonProducts prod, string description);

        /// <summary>
        /// Paypals this instance.
        /// </summary>
        [OperationContract]
        void paypal();

        /// <summary>
        /// Ownerships the request.
        /// </summary>
        /// <param name="currentOwner">The current owner.</param>
        /// <param name="newOwner">The new owner.</param>
        /// <param name="prod">The product.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "OwnershipRequest")]
        string OwnershipRequest(JsonUser currentOwner, JsonUser newOwner, JsonProducts prod);

        /// <summary>
        /// Approves the ownership request.
        /// </summary>
        /// <param name="verdict">The verdict.</param>
        /// <param name="user">The user.</param>
        /// <param name="prod">The product.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "approveOwnershipRequest/{verdict}")]
        string approveOwnershipRequest(string verdict,JsonUser user, JsonProducts prod);

        /// <summary>
        /// Gets the ownership request.
        /// </summary>
        /// <param name="user">The user.</param>
        /// <returns>IEnumerable&lt;JsonOwnershipReq&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getOwnershipRequest")]
        IEnumerable<JsonOwnershipReq> getOwnershipRequest(JsonUser user);

        /// <summary>
        /// Gets the trader in stock.
        /// </summary>
        /// <param name="warehouses">The warehouses.</param>
        /// <returns>IEnumerable&lt;JsonUser&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getTraderInStock")]
        IEnumerable<JsonUser> getTraderInStock(JsonWarehouse warehouses);

        /// <summary>
        /// Adds the warehouse.
        /// </summary>
        /// <param name="warehouse">The warehouse.</param>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addWarehouse")]
        void addWarehouse(JsonWarehouse warehouse);

        /// <summary>
        /// Adds the country.
        /// </summary>
        /// <param name="country">The country.</param>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addCountry")]
        void addCountry(JsonCountry country);

        /// <summary>
        /// Adds the country.
        /// </summary>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "WarehouseItems")]
        List<JsonInventory> items(string id);

        /// <summary>
        /// Gets the warehouse inventory.
        /// </summary>
        /// <param name="warehouses">The warehouses.</param>
        /// 
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getWarehouseInventory")]
        IEnumerable<JsonInventory> getWarehouseInventory(JsonWarehouse warehouses);

        /// <summary>
        /// Gets the warehouse inventory.
        /// </summary>
        /// <param name="id">The warehouses.</param>
        /// <returns>IEnumerable&lt;JsonInventory&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "WarehouseInventory/{id}")]
        IEnumerable<JsonProductInfo> WarehouseInventory(string id);

        /// <summary>
        /// Adds the warehouse man.
        /// </summary>
        /// <param name="user">The user.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addWarehouseMan")]
        string addWarehouseMan(JsonUser user);

        /// <summary>
        /// Gets the warehouse i.
        /// </summary>
        /// <param name="warehouses">The warehouses.</param>
        /// <returns>JsonWarehouse.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getWarehouseI")]
        JsonWarehouse getWarehouseI(JsonWarehouse warehouses);

        /// <summary>
        /// Gets the user.
        /// </summary>
        /// <param name="users">The users.</param>
        /// <returns>JsonUser.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getUser")]
        JsonUser getUser(JsonUser users);

        /// <summary>
        /// Gets the bill.
        /// </summary>
        /// <param name="bill">The bill.</param>
        /// <returns>IEnumerable&lt;JsonBillofEntry&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getBill")]
        IEnumerable<JsonBillofEntry> getBill(JsonBillofEntry bill);

        /// <summary>
        /// Adds the invoice.
        /// </summary>
        /// <param name="bill">The bill.</param>
        /// <param name="product">The product.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addInvoice")]
        string addInvoice(JsonBillofEntry bill, JsonProducts product);

        /// <summary>
        /// Gets the invoice.
        /// </summary>
        /// <param name="invoiceNum">The invoice number.</param>
        /// <param name="products">The products.</param>
        /// <returns>JsonInvoice.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getInvoice")]
        JsonInvoice getInvoice(JsonInvoice invoiceNum, jsonProduct products);

        /// <summary>
        /// Adds the tax.
        /// </summary>
        /// <param name="products">The products.</param>
        /// <param name="newBill">The new bill.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addTax")]
        string addTax(JsonProducts products, JsonBillofEntry newBill);

        /// <summary>
        /// Gets the message.
        /// </summary>
        /// <param name="users">The users.</param>
        /// <returns>IEnumerable&lt;JsonMessage&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getMessages")]
        IEnumerable<JsonMessage> getMessage(JsonUser users);

        /// <summary>
        /// Gets the user ownership request.
        /// </summary>
        /// <param name="user">The user.</param>
        /// <returns>IEnumerable&lt;JsonOwnershipReq&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getUserOwnershipRequest")]
        IEnumerable<JsonOwnershipReq> getUserOwnershipRequest(JsonUser user);

        /// <summary>
        /// Sends the message.
        /// </summary>
        /// <param name="messages">The messages.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "sendMessage")]
        string sendMessage(JsonMessage messages);

        /// <summary>
        /// Pays the tax.
        /// </summary>
        /// <param name="invoices">The invoices.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "payTax")]
        string payTax(JsonInvoice invoices);

        /// <summary>
        /// Findavailablelocations the specified w.
        /// </summary>
        /// <param name="w">The w.</param>
        /// <param name="p">The p.</param>
        /// <returns>jsonlocation.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "findavailablelocation")]
        jsonlocation findavailablelocation(JsonWarehouse w, jsonProduct p);

        /// <summary>
        /// Findlocations the specified w.
        /// </summary>
        /// <param name="w">The w.</param>
        /// <param name="p">The p.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "findlocation")]
        string findlocation(JsonWarehouse w, jsonProduct p);

        /// <summary>
        /// Addlocations the specified loca.
        /// </summary>
        /// <param name="loca">The loca.</param>
        /// <returns>System.String.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addlocation")]
        string addlocation(jsonlocation loca);

        /// <summary>
        /// Gets the package in warehouse.
        /// </summary>
        /// <param name="packageID">The package identifier.</param>
        /// <returns>jsonlocation.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getPackageInWarehouse/{packageID}")]
        jsonlocation getPackageInWarehouse(string packageID);

        /// <summary>
        /// Occupylocations the specified product identifier.
        /// </summary>
        /// <param name="productID">The product identifier.</param>
        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "occupylocation/{productID}")]
        void occupylocation(string productID);

        /// <summary>
        /// Reservelocations the specified jloc.
        /// </summary>
        /// <param name="jloc">The jloc.</param>
        /// <param name="packageid">The packageid.</param>
        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "Reservelocation/{packageid}")]
        void Reservelocation(jsonlocation jloc, string packageid);

        /// <summary>
        /// Vacatelocations the specified package identifier.
        /// </summary>
        /// <param name="packageID">The package identifier.</param>
        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "vacatelocation/{packageID}")]
        void vacatelocation(string packageID);

        /// <summary>
        /// Gets the warehouse locations.
        /// </summary>
        /// <param name="warehousesID">The warehouses identifier.</param>
        /// <returns>IEnumerable&lt;jsonlocation&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getWarehouseLocations/{warehousesID}")]
        IEnumerable<jsonlocation> getWarehouseLocations(string warehousesID);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "updateSection")]
        string updateSection(JsonWarehouse _warehouse);





        //REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS 
        //================================================ ================================================ ================================================ ================================================ ================================================ 
        //double bar graph - occupied space vs total space done
        /// <summary>
        /// Warehouses the availability graph.
        /// </summary>
        /// <returns>IEnumerable&lt;jsonWarehouseAvailabilty&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "WarehouseAvailability")]
        IEnumerable<jsonWarehouseAvailabilty> WarehouseAvailabilityGraph();

        //pie chart for the three size categories for length done
        /// <summary>
        /// Packages the length categories.
        /// </summary>
        /// <returns>IEnumerable&lt;PackageSizeCategory&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "PackageLengthCategories")]
        IEnumerable<PackageSizeCategory> PackageLengthCategories();

        //pie chart for the three size categories for height done
        /// <summary>
        /// Packages the height categories.
        /// </summary>
        /// <returns>IEnumerable&lt;PackageSizeCategory&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "PackageHeightCategories")]
        IEnumerable<PackageSizeCategory> PackageHeightCategories();

        //pie chart for the three size categories for width done
        /// <summary>
        /// Packagewidthes the categories.
        /// </summary>
        /// <returns>IEnumerable&lt;PackageSizeCategory&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "PackagewidthCategories")]
        IEnumerable<PackageSizeCategory> PackagewidthCategories();

        //Number of incidents per warehouse done
        /// <summary>
        /// Warehouses the incidents.
        /// </summary>
        /// <returns>IEnumerable&lt;WarehouseIncidentsGraph&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "WarehouseIncidents")]
        IEnumerable<WarehouseIncidentsGraph> WarehouseIncidents();

        //Most common release destination done
        /// <summary>
        /// Warehouses the releases.
        /// </summary>
        /// <returns>IEnumerable&lt;WarehouseReleasescs&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "WarehouseReleases")]
        IEnumerable<WarehouseReleasescs> WarehouseReleases();

        //Packages Received Per Month For Warehouse done
        /// <summary>
        /// Packageses the per month.
        /// </summary>
        /// <param name="name">The name.</param>
        /// <returns>IEnumerable&lt;PackagePerMonth&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "PackagesPerMonth/{name}")]
        IEnumerable<PackagePerMonth> PackagesPerMonth(string name);

        //Number of incidents last month done
        /// <summary>
        /// Incidentses the last month.
        /// </summary>
        /// <param name="name">The name.</param>
        /// <returns>IEnumerable&lt;OutgoingRate&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "IncidentsLastMonth/{name}")]
        IEnumerable<OutgoingRate> IncidentsLastMonth(string name);


        ////overall rate at which the warehouse is filling up all warehouses
        /// <summary>
        /// Storages the rates.
        /// </summary>
        /// <returns>IEnumerable&lt;WarehousesStorageRates&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "StorageRates")]
        IEnumerable<WarehousesStorageRates> StorageRates();

        //overall rate at which the warehouse is filling specific warehouse each month
        /// <summary>
        /// Storages the rate.
        /// </summary>
        /// <param name="warehouseID">The warehouse identifier.</param>
        /// <returns>IEnumerable&lt;WarehouseStorageRate&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "StorageRate/{warehouseID}")]
        IEnumerable<WarehouseStorageRate> StorageRate(string warehouseID);

        /// <summary>
        /// Storages the filled by.
        /// </summary>
        /// <returns>IEnumerable&lt;StorageFilledBy&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "StorageFilledBy")]
        IEnumerable<StorageFilledBy> StorageFilledBy();

        /// <summary>
        /// Gets the country p.
        /// </summary>
        /// <returns>IEnumerable&lt;JsonCountryPercentage&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getCountryP")]
        IEnumerable<JsonCountryPercentage> getCountryP();

        /// <summary>
        /// Gets the outstanding tax.
        /// </summary>
        /// <returns>System.Double.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getOutstandingTax")]
        double getOutstandingTax();

        /// <summary>
        /// Gets the average tax.
        /// </summary>
        /// <returns>JsonTax.</returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getAverageTax")]
        JsonTax getAverageTax();

        //REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS REPORTS 
        //================================================ ================================================ ================================================ ================================================ ================================================ 


        /// <summary>
        /// Releases the ware house.
        /// </summary>
        /// <param name="warehouse">The warehouse.</param>
        /// <returns>IEnumerable&lt;ReleaseProduct&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "itemsNeedRelease")]
        IEnumerable<ReleaseProduct> releaseWareHouse(JsonWarehouse warehouse);

        /// <summary>
        /// Transfers the ware house.
        /// </summary>
        /// <param name="warehouse">The warehouse.</param>
        /// <returns>IEnumerable&lt;TransferDetails&gt;.</returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "itemsNeedTransfer")]
        IEnumerable<TransferDetails> transferWareHouse(JsonWarehouse warehouse);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addTask")]
        string addTask(JsonTask _task);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getTasks")]
        IEnumerable<JsonTask> getTasks(JsonUser _user);

        [OperationContract]
        [WebInvoke(Method = "PUT", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "completeTask")]
        string completeTask(JsonTask _task);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getWarehouseSection")]
        IEnumerable<IEnumerable<jsonlocation>> getWarehouseSection(JsonWarehouse _warehouse);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "addEmployee")]
        string addEmployee(JsonUser _user, JsonWarehouse _warehouse);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getWarehouseTask")]
        IEnumerable<JsonTask> getWarehouseTask(JsonWarehouse _warehouse);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getEmployees")]
        IEnumerable<JsonUser> getEmployees(JsonWarehouse _warehouse);




        /* [OperationContract]
         [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, UriTemplate = "getPackageNotification")]
         string getPackageNotification(JsonUser user);*/



        // [OperationContract]
        // [WebGet(UriTemplate ="/listProducts", BodyStyle = WebMessageBodyStyle.Bare, RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        // IEnumerable<product> listProduct();

        //[OperationContract]
        // CompositeType GetDataUsingDataContract(CompositeType composite);
    }
}
