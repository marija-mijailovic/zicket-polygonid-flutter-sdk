// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:web3dart/web3dart.dart' as _i1;

final _contractAbi = _i1.ContractAbi.fromJson(
  '[{"inputs":[{"internalType":"contract CredentialVerifier","name":"_credentialVerifier","type":"address"},{"internalType":"contract EventTicket","name":"_eventTicket","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[],"name":"InvalidAmount","type":"error"},{"inputs":[],"name":"InvalidTicketPrice","type":"error"},{"inputs":[],"name":"IvalidEventDate","type":"error"},{"inputs":[],"name":"NotActiveEvent","type":"error"},{"inputs":[],"name":"NotFoundEvent","type":"error"},{"inputs":[],"name":"NotValidAddress","type":"error"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"_sender","type":"address"},{"indexed":true,"internalType":"uint256","name":"_eventId","type":"uint256"},{"components":[{"internalType":"address payable","name":"eventOwner","type":"address"},{"internalType":"uint256","name":"ticketPrice","type":"uint256"},{"internalType":"uint256","name":"totalAmountReceived","type":"uint256"},{"internalType":"uint256","name":"eventStart","type":"uint256"},{"internalType":"uint256","name":"eventEnd","type":"uint256"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string","name":"description","type":"string"},{"internalType":"string","name":"ticketTokenURI","type":"string"}],"indexed":true,"internalType":"struct IZicket.Event","name":"_event","type":"tuple"}],"name":"EventCreation","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"previousOwner","type":"address"},{"indexed":true,"internalType":"address","name":"newOwner","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"_ticketId","type":"uint256"},{"indexed":true,"internalType":"address","name":"_ticketDestinationAddress","type":"address"}],"name":"TicketSBT","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"sender","type":"address"},{"indexed":true,"internalType":"string","name":"did","type":"string"}],"name":"Verified","type":"event"},{"inputs":[{"internalType":"address payable","name":"eventOwner","type":"address"},{"internalType":"uint256","name":"ticketPrie","type":"uint256"},{"internalType":"uint256","name":"totalAmountReceived","type":"uint256"},{"internalType":"uint256","name":"eventStart","type":"uint256"},{"internalType":"uint256","name":"eventEnd","type":"uint256"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string","name":"descripton","type":"string"},{"internalType":"string","name":"ticketTokenURI","type":"string"}],"name":"addNewEvent","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"credentialVerifier","outputs":[{"internalType":"contract CredentialVerifier","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"eventTicket","outputs":[{"internalType":"contract EventTicket","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"events","outputs":[{"internalType":"address payable","name":"eventOwner","type":"address"},{"internalType":"uint256","name":"ticketPrice","type":"uint256"},{"internalType":"uint256","name":"totalAmountReceived","type":"uint256"},{"internalType":"uint256","name":"eventStart","type":"uint256"},{"internalType":"uint256","name":"eventEnd","type":"uint256"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string","name":"description","type":"string"},{"internalType":"string","name":"ticketTokenURI","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"eventId","type":"uint256"},{"internalType":"address","name":"ticketDestinationAddress","type":"address"}],"name":"purchaseTicket","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[],"name":"renounceOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"totalEvents","outputs":[{"internalType":"uint256","name":"_value","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"eventId","type":"uint256"},{"components":[{"internalType":"string","name":"did","type":"string"},{"internalType":"string","name":"hashedPrivKey","type":"string"}],"internalType":"struct IZicket.UserData","name":"userData","type":"tuple"},{"internalType":"uint64","name":"requestId","type":"uint64"},{"internalType":"uint256[]","name":"inputs","type":"uint256[]"}],"name":"userVerification","outputs":[],"stateMutability":"nonpayable","type":"function"}]',
  'CredentialVerifiable',
);

class CredentialVerifiable extends _i1.GeneratedContract {
  CredentialVerifiable({
    required _i1.EthereumAddress address,
    required _i1.Web3Client client,
    int? chainId,
  }) : super(
          _i1.DeployedContract(
            _contractAbi,
            address,
          ),
          client,
          chainId,
        );

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addNewEvent(
    _i1.EthereumAddress eventOwner,
    BigInt ticketPrie,
    BigInt totalAmountReceived,
    BigInt eventStart,
    BigInt eventEnd,
    String name,
    String descripton,
    String ticketTokenURI, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, 'f9b4760b'));
    final params = [
      eventOwner,
      ticketPrie,
      totalAmountReceived,
      eventStart,
      eventEnd,
      name,
      descripton,
      ticketTokenURI,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i1.EthereumAddress> credentialVerifier(
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, 'd9f12503'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i1.EthereumAddress);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i1.EthereumAddress> eventTicket({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, 'b43b6e24'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i1.EthereumAddress);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<Events> events(
    BigInt $param8, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, '0b791430'));
    final params = [$param8];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return Events(response);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i1.EthereumAddress> owner({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, '8da5cb5b'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i1.EthereumAddress);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> purchaseTicket(
    BigInt eventId,
    _i1.EthereumAddress ticketDestinationAddress, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, '3d0c7eb6'));
    final params = [
      eventId,
      ticketDestinationAddress,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> renounceOwnership({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[7];
    assert(checkSignature(function, '715018a6'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> totalEvents({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[8];
    assert(checkSignature(function, 'ba870686'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> transferOwnership(
    _i1.EthereumAddress newOwner, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[9];
    assert(checkSignature(function, 'f2fde38b'));
    final params = [newOwner];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> userVerification(
    BigInt eventId,
    dynamic userData,
    BigInt requestId,
    List<BigInt> inputs, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[10];
    assert(checkSignature(function, 'b372a32f'));
    final params = [
      eventId,
      userData,
      requestId,
      inputs,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// Returns a live stream of all EventCreation events emitted by this contract.
  Stream<EventCreation> eventCreationEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('EventCreation');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return EventCreation(decoded);
    });
  }

  /// Returns a live stream of all OwnershipTransferred events emitted by this contract.
  Stream<OwnershipTransferred> ownershipTransferredEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('OwnershipTransferred');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return OwnershipTransferred(decoded);
    });
  }

  /// Returns a live stream of all TicketSBT events emitted by this contract.
  Stream<TicketSBT> ticketSBTEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('TicketSBT');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return TicketSBT(decoded);
    });
  }

  /// Returns a live stream of all Verified events emitted by this contract.
  Stream<Verified> verifiedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('Verified');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return Verified(decoded);
    });
  }
}

class Events {
  Events(List<dynamic> response)
      : eventOwner = (response[0] as _i1.EthereumAddress),
        ticketPrice = (response[1] as BigInt),
        totalAmountReceived = (response[2] as BigInt),
        eventStart = (response[3] as BigInt),
        eventEnd = (response[4] as BigInt),
        name = (response[5] as String),
        description = (response[6] as String),
        ticketTokenURI = (response[7] as String);

  final _i1.EthereumAddress eventOwner;

  final BigInt ticketPrice;

  final BigInt totalAmountReceived;

  final BigInt eventStart;

  final BigInt eventEnd;

  final String name;

  final String description;

  final String ticketTokenURI;
}

class EventCreation {
  EventCreation(List<dynamic> response)
      : sender = (response[0] as _i1.EthereumAddress),
        eventId = (response[1] as BigInt),
        event = (response[2] as dynamic);

  final _i1.EthereumAddress sender;

  final BigInt eventId;

  final dynamic event;
}

class OwnershipTransferred {
  OwnershipTransferred(List<dynamic> response)
      : previousOwner = (response[0] as _i1.EthereumAddress),
        newOwner = (response[1] as _i1.EthereumAddress);

  final _i1.EthereumAddress previousOwner;

  final _i1.EthereumAddress newOwner;
}

class TicketSBT {
  TicketSBT(List<dynamic> response)
      : ticketId = (response[0] as BigInt),
        ticketDestinationAddress = (response[1] as _i1.EthereumAddress);

  final BigInt ticketId;

  final _i1.EthereumAddress ticketDestinationAddress;
}

class Verified {
  Verified(List<dynamic> response)
      : sender = (response[0] as _i1.EthereumAddress),
        did = (response[1] as String);

  final _i1.EthereumAddress sender;

  final String did;
}
