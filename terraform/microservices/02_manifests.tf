# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

resource "kubernetes_manifest" "service_manifests" {
  for_each = fileset("${path.module}/..", "../kubernetes-manifests/*.yaml")
  manifest = yamldecode(file("${each.key}"))
/*   wait_for = {
    fields = {
      # Check the phase of a pod
      "status.phase" = "Running"
      # Check a container's status
      "status.containerStatuses[0].ready" = "true",
    }
  } */
}