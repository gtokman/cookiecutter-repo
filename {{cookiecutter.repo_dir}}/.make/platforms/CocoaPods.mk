# Copyright © 2020 djrlj694.dev. All rights reserved.
# ============================================================================ #
# PROGRAM: CocoaPods
# AUTHORS: Robert (Bob) L. Jones
# VERSION: 0.0.0
# CREATED: 04FEB2019
# REVISED: 22AUG2020
# ============================================================================ #
# For info on terminology or style conventions, see ".make/README.md".
# ============================================================================ #


# ============================================================================ #
# INTERNAL CONSTANTS
# ============================================================================ #

# -- Filesystem -- #

COCOAPODS_FILES := Framework.podspec


# ============================================================================ #
# PHONY TARGETS
# ============================================================================ #

# -- Prerequisite for "clean" Target -- #

.PHONY: clean-cocoapods

## Completes all CocoaPods cleanup activities.
clean-cocoapods: | $(LOG)
	@printf "Removing CocoaPods setup..."
	@rm -rf $(COCOAPODS_FILES) >$(LOG) 2>&1; \
	$(status_result)

# -- Prerequisite for "init" Target -- #

.PHONY: init-cocoapods 

## init-cocoapods: Completes all initial CocoaPods setup activities.
init-cocoapods: $(COCOAPODS_FILES)


# ============================================================================ #
# FILE TARGETS
# ============================================================================ #

# Makes a Framework.podspec file.
Framework.podspec: Framework.podspec.download


# ============================================================================ #
# INTERMEDIATE TARGETS
# ============================================================================ #

.INTERMEDIATE: Framework.podspec.download
