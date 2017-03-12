class StopWatch {
  private int startTime, stopTime;
  private boolean running;


  StopWatch() {
    startTime = 0;
    stopTime = 0;
    running= false;
  }
  public void Start() {
    startTime = millis();
    running = true;
  }
  public void Stop() {
    stopTime = millis();
    running = false;
  }
  private int GetElapsedTime() {
    if (running) {
      return (millis() - startTime);
    }
    return (stopTime - startTime);
  }
  public int GetSeconds() {
    return (GetElapsedTime() / 1000);
  }
  public int GetMinutes() {
    return (GetElapsedTime() / (1000*60));
  }
  public int GetHours() {
    return (GetElapsedTime() / (1000*60*60));
  }
  public void Restart() {
    startTime = millis();
  }
}
