import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/s3_config.dart';

class ApiService {
  static const String baseUrl = 'YOUR_API_BASE_URL'; // Replace with your actual API URL

  static Future<S3Config?> getS3Config() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/s3-config'), // Replace with your actual endpoint
        headers: {
          'Content-Type': 'application/json',
          // Add any required headers like Authorization
        },
      );

      // Debug: Print raw response
      log('Response Status Code: ${response.statusCode}');
      log('Response Headers: ${response.headers}');
      log('Raw Response Body: ${response.body}');

      if (response.statusCode == 200) {
        // Parse the response body
        final Map<String, dynamic> jsonData = json.decode(response.body);
        
        // Debug: Print parsed JSON
        log('Parsed JSON: $jsonData');
        
        // Check if the response has the expected structure
        if (jsonData.containsKey('data')) {
          // If the API wraps the data in a 'data' field
          final configData = jsonData['data'] as Map<String, dynamic>;
          log('Config Data: $configData');
          return S3Config.fromJson(configData);
        } else {
          // If the response is the config data directly
          return S3Config.fromJson(jsonData);
        }
      } else {
        log('API Error: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e, stackTrace) {
      log('Exception in getS3Config: $e');
      log('Stack trace: $stackTrace');
      return null;
    }
  }

  // Alternative method if you need to debug the exact response structure
  static Future<Map<String, dynamic>?> getS3ConfigRaw() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/s3-config'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      log('=== RAW API RESPONSE DEBUG ===');
      log('Status Code: ${response.statusCode}');
      log('Response Body Type: ${response.body.runtimeType}');
      log('Response Body Length: ${response.body.length}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        log('Parsed JSON Type: ${jsonData.runtimeType}');
        log('Parsed JSON: $jsonData');
        
        // Check each field individually
        if (jsonData is Map<String, dynamic>) {
          jsonData.forEach((key, value) {
            log('Field "$key": $value (${value.runtimeType})');
          });
        }
        
        return jsonData;
      }
      return null;
    } catch (e, stackTrace) {
      log('Exception in getS3ConfigRaw: $e');
      log('Stack trace: $stackTrace');
      return null;
    }
  }
}

// Usage example widget
class S3ConfigDebugWidget extends StatefulWidget {
  const S3ConfigDebugWidget({super.key});

  @override
  State<S3ConfigDebugWidget> createState() => _S3ConfigDebugWidgetState();
}

class _S3ConfigDebugWidgetState extends State<S3ConfigDebugWidget> {
  S3Config? s3Config;
  Map<String, dynamic>? rawData;
  bool isLoading = false;
  String? error;

  @override
  void initState() {
    super.initState();
    _loadS3Config();
  }

  Future<void> _loadS3Config() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      // First, get raw data for debugging
      rawData = await ApiService.getS3ConfigRaw();
      
      // Then, try to parse it into the model
      s3Config = await ApiService.getS3Config();
      
      log('=== FINAL RESULTS ===');
      log('Raw Data: $rawData');
      log('Parsed S3Config: $s3Config');
      
    } catch (e) {
      error = e.toString();
      log('Error loading S3 config: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S3 Config Debug'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadS3Config,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : error != null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Error: $error'),
                        ElevatedButton(
                          onPressed: _loadS3Config,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Raw API Response:',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            rawData?.toString() ?? 'No data',
                            style: const TextStyle(fontFamily: 'monospace'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Parsed S3Config:',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            s3Config?.toString() ?? 'No config parsed',
                            style: const TextStyle(fontFamily: 'monospace'),
                          ),
                        ),
                        if (s3Config != null) ...[
                          const SizedBox(height: 20),
                          const Text(
                            'Individual Fields:',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          _buildFieldTile('Access Key', s3Config!.accessKey),
                          _buildFieldTile('Access Key ID', s3Config!.accessKeyId),
                          _buildFieldTile('Bucket Name', s3Config!.bucketName),
                          _buildFieldTile('Region', s3Config!.region),
                          _buildFieldTile('Endpoint', s3Config!.endpoint),
                          _buildFieldTile('Folder Path', s3Config!.folderPath),
                          _buildFieldTile('S3 URL Style', s3Config!.s3URLStyle),
                          _buildFieldTile('Auth Type', s3Config!.authenticationType ?? 'null'),
                        ],
                      ],
                    ),
                  ),
      ),
    );
  }

  Widget _buildFieldTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? '(empty)' : value,
              style: TextStyle(
                color: value.isEmpty ? Colors.red : Colors.black,
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart'; 