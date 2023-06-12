import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class ConexionMqtt extends StatefulWidget {
  @override
  _ConexionMqttState createState() => _ConexionMqttState();
}

class _ConexionMqttState extends State<ConexionMqtt> {
  late MqttServerClient client;
  bool isConnected = false;
  bool isSubscribed = false;

  @override
  void initState() {
    super.initState();
    client = MqttServerClient('broker.emqx.io', 'mqttx_bf99efcd'); //mio mqttx_41bf5856
    client.port = 1883;
    client.logging(on: true);
    client.onConnected = _onConnected;
    client.onDisconnected = _onDisconnected;
    client.onSubscribed = _onSubscribed;
    client.onSubscribeFail = _onSubscribeFail;
    client.onUnsubscribed = _onUnsubscribed;
    client.pongCallback = _pong;
    client.secure = false; // No se utiliza seguridad TLS

    final connMessage = MqttConnectMessage()
        .keepAliveFor(60)
        .withWillTopic('willtopic')
        .withWillMessage('Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMessage;

    // Agregar el identificador de cliente
    client.clientIdentifier = 'myClientId';
  }

  void _onConnected() {
    setState(() {
      isConnected = true;
    });
    print('Connected to MQTT broker');
  }

  void _onDisconnected() {
    setState(() {
      isConnected = false;
      isSubscribed = false;
    });
    print('Disconnected from MQTT broker');
  }

  void _onSubscribed(String topic) {
    print('Subscribed topic: $topic');
  }

  void _onSubscribeFail(String topic) {
    print('Failed to subscribe $topic');
  }

  void _onUnsubscribed(String? topic) {
    print('Unsubscribed topic: $topic');
  }

  void _pong() {
    print('Ping response client callback invoked');
  }

  Future<void> connect() async {
    try {
      await client.connect();
      print('Connected to MQTT broker');
    } catch (e) {
      print('Exception: $e');
      client.disconnect();
    }

    client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
      final payload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);

      print('Received message: $payload from topic: ${c[0].topic}>');
    });
  }

  void publishMessage(String message) {
    if (isConnected) {
      final topic = 'foco14'; //invernadero/a
      final builder = MqttClientPayloadBuilder();
      builder.addString(message);
      client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
      print('Published message: $message');
    }
  }

  void subscribe() {
    if (isConnected && !isSubscribed) {
      final topic = 'foco14';
      client.subscribe(topic, MqttQos.atLeastOnce);
      setState(() {
        isSubscribed = true;
      });
      print('Subscribed to topic: $topic');
    }
  }

  void unsubscribe() {
    if (isConnected && isSubscribed) {
      final topic = 'foco14';
      client.unsubscribe(topic);
      setState(() {
        isSubscribed = false;
      });
      print('Unsubscribed from topic: $topic');
    }


  }

  void disconnect() {
    if (isConnected) {
      client.disconnect();
      setState(() {
        isConnected = false;
        isSubscribed = false;
      });
      print('Disconnected from MQTT broker');
    }
  }

  @override
  void dispose() {
    client.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Device Status:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isConnected ? null : connect,
              child: Text('Connect'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: isConnected ? () => publishMessage('Conexion Exitosa Yare') : null,
              child: Text('Publish'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: isConnected && !isSubscribed ? subscribe: null,
              child: Text('Subscribe'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: isConnected && isSubscribed ? unsubscribe : null,
              child: Text('Unsubscribe'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: isConnected ? disconnect : null,
              child: Text('Disconnect'),
            ),
          ],
        ),
      ),
    );
  }
}