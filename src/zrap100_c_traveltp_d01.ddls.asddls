@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Proj View for ZRAP100_R_TRAVELTP_D01'
@Search.searchable: true
@ObjectModel.semanticKey: [ 'TravelID' ]

define root view entity ZRAP100_C_TRAVELTP_D01
  provider contract transactional_query
  as projection on ZRAP100_R_TRAVELTP_D01
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
  key TravelID,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['AgencyName']
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Agency', element: 'AgencyID' } }]
      AgencyID,
      _Agency.Name              as AgencyName,
      CustomerID,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['CustomerName']
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  } }]
      _Customer.LastName        as CustomerName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_Currency', element: 'Currency' } }]
      CurrencyCode,
      Description,
      @ObjectModel.text.element: ['OverallStatusText']
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Overall_Status_VH', element: 'OverallStatus' } }]
      OverallStatus,
      _OverallStatus._Text.Text as OverallStatusText : localized,
      Attachment,
      MimeType,
      FileName,
      LocalLastChangedAt

}
