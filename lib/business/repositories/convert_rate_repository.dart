abstract class ConvertRateRepository {
  double getConvertRate({
    required String sourceId,
    required String destinationId,
  });
}
