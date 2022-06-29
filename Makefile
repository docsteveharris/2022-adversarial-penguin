

# convert to word to run the style/grammar checks in American English
word:
	pandoc \
		10-intro.md \
		20-real-world-development.md \
		30-ml-ops.md \
		40-responsible-ai.md \
		50-implementation.md \
		60-continuous-evaluation.md \
		80-drug-development.md \
		81-conclusion.md \
		-o temp.docx