import utest.Runner;
import utest.ui.Report;

class Main {
	public static function main():Void {
		var runner = new Runner();
		runner.addCase(new mxhx.symbols.MXHXSymbolToolsCanAssignToTest());

		#if (html5 && playwright)
		// special case: see below for details
		setupHeadlessMode(runner);
		#else
		// a report prints the final results after all tests have run
		Report.create(runner);
		#end

		// don't forget to start the runner
		runner.run();
	}

	#if (js && playwright)
	/**
		Developers using continuous integration might want to run the html5
		target in a "headless" browser using playwright. To do that, add
		-Dplaywright to your command line options when building.

		@see https://playwright.dev
	**/
	private function setupHeadlessMode(runner:Runner):Void {
		new utest.ui.text.PrintReport(runner);
		var aggregator = new utest.ui.common.ResultAggregator(runner, true);
		aggregator.onComplete.add(function(result:utest.ui.common.PackageResult):Void {
			Reflect.setField(js.Lib.global, "utestResult", result);
		});
	}
	#end
}
