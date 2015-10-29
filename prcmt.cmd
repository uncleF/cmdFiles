::Commit and Push Project Changes

@echo off

set message="Project Update"
set remote=origin

:options
	if [%1]==[] (
		goto commit
	) else (
		if [%1]==[-m] (
			if NOT [%2]==[] if NOT [%2]==[-r] (
				set message=%2
				shift
				shift
				goto options
			) else (
				if [%2]==[-r] (
					shift
					goto options
				) else (
					goto commit
				)
			)
		)
		if [%1]==[-r] (
			if NOT [%2]==[] if NOT [%2]==[-r] (
				set remote=%2
				shift
				shift
				goto options
			) else (
				if [%2]==[-m] (
					shift
					goto options
				) else (
					goto commit
				)
			)
		)
	)

:commit
	git add -A
	git commit -a -m %message%
	git push %remote%