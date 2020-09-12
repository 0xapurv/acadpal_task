import 'package:acadpal_task/models/models.dart';
import 'package:flutter/material.dart';
import '../models/model.dart';
import 'repositories.dart';

class ApiRepository {
  final ApiClient apiClient;

  ApiRepository({@required this.apiClient});

  Future<Covid19> getAllData() async {
    return apiClient.getAllData();
  }

  fetchTotalData() async {
    return apiClient.fetchTotalData();
  }

  fetchChartData() async {
    return apiClient.fetchchartData();
  }

  fetchTestData() async {
    return apiClient.fetchTestData();
  }

  fetchStatesLength() async {
    return apiClient.fetchStatesLengthData();
  }

  fetchStatesDailyData() async {
    return apiClient.fetchStatesDailyData();
  }

  fetchStatesDailyDataLength() async {
    return apiClient.fetchStatesDailyDataLength();
  }

  fetchZoneData() async {
    return apiClient.fetchZoneData();
  }

  fetchZoneDataLength() async {
    return apiClient.fetchZoneDataLength();
  }
}
