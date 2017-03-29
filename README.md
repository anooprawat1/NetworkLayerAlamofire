# NetworkLayerAlamofire

Most of the apps interact with server, So there must be network layer abstraction to interact with server.

NetworkLayerProtocolUrlSessesion demonstrate a way of abstraction and interaction with server. It uses protocol oriented
programming to communicate and also uses same for Unit Test. It helps in

1 Flexibility, To be able to edit or add new urls efficiently.

2 Readability, Makes your code more readable.

3 Code safety, with typed parameters. This allow all the pre-compilation goodness we expect from Xcode.

4 Easy debugging, meaning being able to insert logs before and after web requests.

5 Testable Network Code.

ApiManager.swift class is single source of communication between your app and server. It uses Alamofire to send GET/POST request.This always return JSON data.

UserApiManager.swift class is abstraction layer between URLSession and your app logic code. This always return your data model.

**NetworkLayerSessionTests includes Unit test of network layer**

MockApiManager.swift uses a protocol oriented way to stub the request with local data.
