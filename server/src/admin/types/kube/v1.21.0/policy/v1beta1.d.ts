import { Condition, DeleteOptions, LabelSelector, ListMeta, ObjectMeta, Time } from "../meta/v1";
import { SELinuxOptions } from "../core/v1";
/**
 * AllowedCSIDriver represents a single inline CSI Driver that is allowed to be used.
 */
export interface AllowedCSIDriver {
    /**
     * Name is the registered name of the CSI driver
     */
    name: string;
}
/**
 * AllowedFlexVolume represents a single Flexvolume that is allowed to be used.
 */
export interface AllowedFlexVolume {
    /**
     * driver is the name of the Flexvolume driver.
     */
    driver: string;
}
/**
 * AllowedHostPath defines the host volume conditions that will be enabled by a policy for pods to use. It requires the path prefix to be defined.
 */
export interface AllowedHostPath {
    /**
     * pathPrefix is the path prefix that the host volume must match. It does not support `*`. Trailing slashes are trimmed when validating the path prefix with a host path.
     *
     * Examples: `/foo` would allow `/foo`, `/foo/` and `/foo/bar` `/foo` would not allow `/food` or `/etc/foo`
     */
    pathPrefix?: string;
    /**
     * when set to true, will allow host volumes matching the pathPrefix only if all volume mounts are readOnly.
     */
    readOnly?: boolean;
}
/**
 * Eviction evicts a pod from its node subject to certain policies and safety constraints. This is a subresource of Pod.  A request to cause such an eviction is created by POSTing to .../pods/<pod name>/evictions.
 */
export interface Eviction {
    /**
     * APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
     */
    apiVersion?: "policy/v1beta1";
    /**
     * DeleteOptions may be provided
     */
    deleteOptions?: DeleteOptions;
    /**
     * Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
     */
    kind?: "Eviction";
    /**
     * ObjectMeta describes the pod that is being evicted.
     */
    metadata?: ObjectMeta;
}
/**
 * FSGroupStrategyOptions defines the strategy type and options used to create the strategy.
 */
export interface FSGroupStrategyOptions {
    /**
     * ranges are the allowed ranges of fs groups.  If you would like to force a single fs group then supply a single range with the same start and end. Required for MustRunAs.
     */
    ranges?: Array<IDRange>;
    /**
     * rule is the strategy that will dictate what FSGroup is used in the SecurityContext.
     */
    rule?: string;
}
/**
 * HostPortRange defines a range of host ports that will be enabled by a policy for pods to use.  It requires both the start and end to be defined.
 */
export interface HostPortRange {
    /**
     * max is the end of the range, inclusive.
     */
    max: number;
    /**
     * min is the start of the range, inclusive.
     */
    min: number;
}
/**
 * IDRange provides a min/max of an allowed range of IDs.
 */
export interface IDRange {
    /**
     * max is the end of the range, inclusive.
     */
    max: number;
    /**
     * min is the start of the range, inclusive.
     */
    min: number;
}
/**
 * PodDisruptionBudget is an object to define the max disruption that can be caused to a collection of pods
 */
export interface PodDisruptionBudget {
    /**
     * APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
     */
    apiVersion?: "policy/v1beta1";
    /**
     * Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
     */
    kind?: "PodDisruptionBudget";
    metadata?: ObjectMeta;
    /**
     * Specification of the desired behavior of the PodDisruptionBudget.
     */
    spec?: PodDisruptionBudgetSpec;
    /**
     * Most recently observed status of the PodDisruptionBudget.
     */
    status?: PodDisruptionBudgetStatus;
}
/**
 * PodDisruptionBudgetList is a collection of PodDisruptionBudgets.
 */
export interface PodDisruptionBudgetList {
    /**
     * APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
     */
    apiVersion?: "policy/v1beta1";
    items: Array<PodDisruptionBudget>;
    /**
     * Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
     */
    kind?: "PodDisruptionBudgetList";
    metadata?: ListMeta;
}
/**
 * PodDisruptionBudgetSpec is a description of a PodDisruptionBudget.
 */
export interface PodDisruptionBudgetSpec {
    /**
     * An eviction is allowed if at most "maxUnavailable" pods selected by "selector" are unavailable after the eviction, i.e. even in absence of the evicted pod. For example, one can prevent all voluntary evictions by specifying 0. This is a mutually exclusive setting with "minAvailable".
     */
    maxUnavailable?: number | string;
    /**
     * An eviction is allowed if at least "minAvailable" pods selected by "selector" will still be available after the eviction, i.e. even in the absence of the evicted pod.  So for example you can prevent all voluntary evictions by specifying "100%".
     */
    minAvailable?: number | string;
    /**
     * Label query over pods whose evictions are managed by the disruption budget. A null selector selects no pods. An empty selector ({}) also selects no pods, which differs from standard behavior of selecting all pods. In policy/v1, an empty selector will select all pods in the namespace.
     */
    selector?: LabelSelector;
}
/**
 * PodDisruptionBudgetStatus represents information about the status of a PodDisruptionBudget. Status may trail the actual state of a system.
 */
export interface PodDisruptionBudgetStatus {
    /**
     * Conditions contain conditions for PDB. The disruption controller sets the DisruptionAllowed condition. The following are known values for the reason field (additional reasons could be added in the future): - SyncFailed: The controller encountered an error and wasn't able to compute
     *               the number of allowed disruptions. Therefore no disruptions are
     *               allowed and the status of the condition will be False.
     * - InsufficientPods: The number of pods are either at or below the number
     *                     required by the PodDisruptionBudget. No disruptions are
     *                     allowed and the status of the condition will be False.
     * - SufficientPods: There are more pods than required by the PodDisruptionBudget.
     *                   The condition will be True, and the number of allowed
     *                   disruptions are provided by the disruptionsAllowed property.
     */
    conditions?: Array<Condition>;
    /**
     * current number of healthy pods
     */
    currentHealthy: number;
    /**
     * minimum desired number of healthy pods
     */
    desiredHealthy: number;
    /**
     * DisruptedPods contains information about pods whose eviction was processed by the API server eviction subresource handler but has not yet been observed by the PodDisruptionBudget controller. A pod will be in this map from the time when the API server processed the eviction request to the time when the pod is seen by PDB controller as having been marked for deletion (or after a timeout). The key in the map is the name of the pod and the value is the time when the API server processed the eviction request. If the deletion didn't occur and a pod is still there it will be removed from the list automatically by PodDisruptionBudget controller after some time. If everything goes smooth this map should be empty for the most of the time. Large number of entries in the map may indicate problems with pod deletions.
     */
    disruptedPods?: {
        [name: string]: Time;
    };
    /**
     * Number of pod disruptions that are currently allowed.
     */
    disruptionsAllowed: number;
    /**
     * total number of pods counted by this disruption budget
     */
    expectedPods: number;
    /**
     * Most recent generation observed when updating this PDB status. DisruptionsAllowed and other status information is valid only if observedGeneration equals to PDB's object generation.
     */
    observedGeneration?: number;
}
/**
 * PodSecurityPolicy governs the ability to make requests that affect the Security Context that will be applied to a pod and container. Deprecated in 1.21.
 */
export interface PodSecurityPolicy {
    /**
     * APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
     */
    apiVersion?: "policy/v1beta1";
    /**
     * Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
     */
    kind?: "PodSecurityPolicy";
    /**
     * Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
     */
    metadata?: ObjectMeta;
    /**
     * spec defines the policy enforced.
     */
    spec?: PodSecurityPolicySpec;
}
/**
 * PodSecurityPolicyList is a list of PodSecurityPolicy objects.
 */
export interface PodSecurityPolicyList {
    /**
     * APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
     */
    apiVersion?: "policy/v1beta1";
    /**
     * items is a list of schema objects.
     */
    items: Array<PodSecurityPolicy>;
    /**
     * Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
     */
    kind?: "PodSecurityPolicyList";
    /**
     * Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
     */
    metadata?: ListMeta;
}
/**
 * PodSecurityPolicySpec defines the policy enforced.
 */
export interface PodSecurityPolicySpec {
    /**
     * allowPrivilegeEscalation determines if a pod can request to allow privilege escalation. If unspecified, defaults to true.
     */
    allowPrivilegeEscalation?: boolean;
    /**
     * AllowedCSIDrivers is an allowlist of inline CSI drivers that must be explicitly set to be embedded within a pod spec. An empty value indicates that any CSI driver can be used for inline ephemeral volumes. This is a beta field, and is only honored if the API server enables the CSIInlineVolume feature gate.
     */
    allowedCSIDrivers?: Array<AllowedCSIDriver>;
    /**
     * allowedCapabilities is a list of capabilities that can be requested to add to the container. Capabilities in this field may be added at the pod author's discretion. You must not list a capability in both allowedCapabilities and requiredDropCapabilities.
     */
    allowedCapabilities?: Array<string>;
    /**
     * allowedFlexVolumes is an allowlist of Flexvolumes.  Empty or nil indicates that all Flexvolumes may be used.  This parameter is effective only when the usage of the Flexvolumes is allowed in the "volumes" field.
     */
    allowedFlexVolumes?: Array<AllowedFlexVolume>;
    /**
     * allowedHostPaths is an allowlist of host paths. Empty indicates that all host paths may be used.
     */
    allowedHostPaths?: Array<AllowedHostPath>;
    /**
     * AllowedProcMountTypes is an allowlist of allowed ProcMountTypes. Empty or nil indicates that only the DefaultProcMountType may be used. This requires the ProcMountType feature flag to be enabled.
     */
    allowedProcMountTypes?: Array<string>;
    /**
     * allowedUnsafeSysctls is a list of explicitly allowed unsafe sysctls, defaults to none. Each entry is either a plain sysctl name or ends in "*" in which case it is considered as a prefix of allowed sysctls. Single * means all unsafe sysctls are allowed. Kubelet has to allowlist all allowed unsafe sysctls explicitly to avoid rejection.
     *
     * Examples: e.g. "foo/*" allows "foo/bar", "foo/baz", etc. e.g. "foo.*" allows "foo.bar", "foo.baz", etc.
     */
    allowedUnsafeSysctls?: Array<string>;
    /**
     * defaultAddCapabilities is the default set of capabilities that will be added to the container unless the pod spec specifically drops the capability.  You may not list a capability in both defaultAddCapabilities and requiredDropCapabilities. Capabilities added here are implicitly allowed, and need not be included in the allowedCapabilities list.
     */
    defaultAddCapabilities?: Array<string>;
    /**
     * defaultAllowPrivilegeEscalation controls the default setting for whether a process can gain more privileges than its parent process.
     */
    defaultAllowPrivilegeEscalation?: boolean;
    /**
     * forbiddenSysctls is a list of explicitly forbidden sysctls, defaults to none. Each entry is either a plain sysctl name or ends in "*" in which case it is considered as a prefix of forbidden sysctls. Single * means all sysctls are forbidden.
     *
     * Examples: e.g. "foo/*" forbids "foo/bar", "foo/baz", etc. e.g. "foo.*" forbids "foo.bar", "foo.baz", etc.
     */
    forbiddenSysctls?: Array<string>;
    /**
     * fsGroup is the strategy that will dictate what fs group is used by the SecurityContext.
     */
    fsGroup: FSGroupStrategyOptions;
    /**
     * hostIPC determines if the policy allows the use of HostIPC in the pod spec.
     */
    hostIPC?: boolean;
    /**
     * hostNetwork determines if the policy allows the use of HostNetwork in the pod spec.
     */
    hostNetwork?: boolean;
    /**
     * hostPID determines if the policy allows the use of HostPID in the pod spec.
     */
    hostPID?: boolean;
    /**
     * hostPorts determines which host port ranges are allowed to be exposed.
     */
    hostPorts?: Array<HostPortRange>;
    /**
     * privileged determines if a pod can request to be run as privileged.
     */
    privileged?: boolean;
    /**
     * readOnlyRootFilesystem when set to true will force containers to run with a read only root file system.  If the container specifically requests to run with a non-read only root file system the PSP should deny the pod. If set to false the container may run with a read only root file system if it wishes but it will not be forced to.
     */
    readOnlyRootFilesystem?: boolean;
    /**
     * requiredDropCapabilities are the capabilities that will be dropped from the container.  These are required to be dropped and cannot be added.
     */
    requiredDropCapabilities?: Array<string>;
    /**
     * RunAsGroup is the strategy that will dictate the allowable RunAsGroup values that may be set. If this field is omitted, the pod's RunAsGroup can take any value. This field requires the RunAsGroup feature gate to be enabled.
     */
    runAsGroup?: RunAsGroupStrategyOptions;
    /**
     * runAsUser is the strategy that will dictate the allowable RunAsUser values that may be set.
     */
    runAsUser: RunAsUserStrategyOptions;
    /**
     * runtimeClass is the strategy that will dictate the allowable RuntimeClasses for a pod. If this field is omitted, the pod's runtimeClassName field is unrestricted. Enforcement of this field depends on the RuntimeClass feature gate being enabled.
     */
    runtimeClass?: RuntimeClassStrategyOptions;
    /**
     * seLinux is the strategy that will dictate the allowable labels that may be set.
     */
    seLinux: SELinuxStrategyOptions;
    /**
     * supplementalGroups is the strategy that will dictate what supplemental groups are used by the SecurityContext.
     */
    supplementalGroups: SupplementalGroupsStrategyOptions;
    /**
     * volumes is an allowlist of volume plugins. Empty indicates that no volumes may be used. To allow all volumes you may use '*'.
     */
    volumes?: Array<string>;
}
/**
 * RunAsGroupStrategyOptions defines the strategy type and any options used to create the strategy.
 */
export interface RunAsGroupStrategyOptions {
    /**
     * ranges are the allowed ranges of gids that may be used. If you would like to force a single gid then supply a single range with the same start and end. Required for MustRunAs.
     */
    ranges?: Array<IDRange>;
    /**
     * rule is the strategy that will dictate the allowable RunAsGroup values that may be set.
     */
    rule: string;
}
/**
 * RunAsUserStrategyOptions defines the strategy type and any options used to create the strategy.
 */
export interface RunAsUserStrategyOptions {
    /**
     * ranges are the allowed ranges of uids that may be used. If you would like to force a single uid then supply a single range with the same start and end. Required for MustRunAs.
     */
    ranges?: Array<IDRange>;
    /**
     * rule is the strategy that will dictate the allowable RunAsUser values that may be set.
     */
    rule: string;
}
/**
 * RuntimeClassStrategyOptions define the strategy that will dictate the allowable RuntimeClasses for a pod.
 */
export interface RuntimeClassStrategyOptions {
    /**
     * allowedRuntimeClassNames is an allowlist of RuntimeClass names that may be specified on a pod. A value of "*" means that any RuntimeClass name is allowed, and must be the only item in the list. An empty list requires the RuntimeClassName field to be unset.
     */
    allowedRuntimeClassNames: Array<string>;
    /**
     * defaultRuntimeClassName is the default RuntimeClassName to set on the pod. The default MUST be allowed by the allowedRuntimeClassNames list. A value of nil does not mutate the Pod.
     */
    defaultRuntimeClassName?: string;
}
/**
 * SELinuxStrategyOptions defines the strategy type and any options used to create the strategy.
 */
export interface SELinuxStrategyOptions {
    /**
     * rule is the strategy that will dictate the allowable labels that may be set.
     */
    rule: string;
    /**
     * seLinuxOptions required to run as; required for MustRunAs More info: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/
     */
    seLinuxOptions?: SELinuxOptions;
}
/**
 * SupplementalGroupsStrategyOptions defines the strategy type and options used to create the strategy.
 */
export interface SupplementalGroupsStrategyOptions {
    /**
     * ranges are the allowed ranges of supplemental groups.  If you would like to force a single supplemental group then supply a single range with the same start and end. Required for MustRunAs.
     */
    ranges?: Array<IDRange>;
    /**
     * rule is the strategy that will dictate what supplemental groups is used in the SecurityContext.
     */
    rule?: string;
}
