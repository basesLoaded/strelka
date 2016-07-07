#!/usr/bin/env bash
#
# Strelka - Small Variant Caller
# Copyright (c) 2009-2016 Illumina, Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#

set -o nounset
set -o xtrace

rel2abs() {
    cd $1 && pwd -P
}

scriptDir=$(rel2abs $(dirname $0))

# check all EVS models
EVSDir=$scriptDir/../empiricalVariantScoring
for modelPrefix in germline somatic; do
    $scriptDir/validateJsonModelFromSchema.py --schema ${EVSDir}/schema/empiricalScoringModelSchema.json < ${EVSDir}/models/${modelPrefix}VariantScoringModels.json
done

