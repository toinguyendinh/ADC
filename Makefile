.PHONY: run_matlab
run_matlab:
	matlab -nodisplay -nosplash -r "run('$(name)')"
