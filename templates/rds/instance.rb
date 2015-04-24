RailsDB: {
   "Type": "AWS::RDS::DBInstance",
   "Properties":
   {
      "AllocatedStorage": 5,
      "DBInstanceClass": "db.t1.micro",
      "DBInstanceIdentifier": "<%= name+'db' %>",
      "DBName": "<%= name %>",
      "Engine": "postgres",
      "EngineVersion": "9.3.3",
      "MasterUsername": "<%= name+'User' %>",
      "MasterUserPassword": "<%= db_password %>",
      "PubliclyAccessible": true,
      "VPCSecurityGroups" : [ String, ... ]
   }
} 