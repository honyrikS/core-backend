import { ListMeta, ObjectMeta, Time } from "../meta/v1";
/**
 * CustomResourceColumnDefinition specifies a column for server side printing.
 */
export interface CustomResourceColumnDefinition {
    /**
     * JSONPath is a simple JSON path (i.e. with array notation) which is evaluated against each custom resource to produce the value for this column.
     */
    JSONPath: string;
    /**
     * description is a human readable description of this column.
     */
    description?: string;
    /**
     * format is an optional OpenAPI type definition for this column. The 'name' format is applied to the primary identifier column to assist in clients identifying column is the resource name. See https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types for details.
     */
    format?: string;
    /**
     * name is a human readable name for the column.
     */
    name: string;
    /**
     * priority is an integer defining the relative importance of this column compared to others. Lower numbers are considered higher priority. Columns that may be omitted in limited space scenarios should be given a priority greater than 0.
     */
    priority?: number;
    /**
     * type is an OpenAPI type definition for this column. See https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types for details.
     */
    type: string;
}
/**
 * CustomResourceConversion describes how to convert different versions of a CR.
 */
export interface CustomResourceConversion {
    /**
     * conversionReviewVersions is an ordered list of preferred `ConversionReview` versions the Webhook expects. The API server will use the first version in the list which it supports. If none of the versions specified in this list are supported by API server, conversion will fail for the custom resource. If a persisted Webhook configuration specifies allowed versions and does not include any versions known to the API Server, calls to the webhook will fail. Defaults to `["v1beta1"]`.
     */
    conversionReviewVersions?: Array<string>;
    /**
     * strategy specifies how custom resources are converted between versions. Allowed values are: - `None`: The converter only change the apiVersion and would not touch any other field in the custom resource. - `Webhook`: API Server will call to an external webhook to do the conversion. Additional information
     *   is needed for this option. This requires spec.preserveUnknownFields to be false, and spec.conversion.webhookClientConfig to be set.
     */
    strategy: string;
    /**
     * webhookClientConfig is the instructions for how to call the webhook if strategy is `Webhook`. Required when `strategy` is set to `Webhook`.
     */
    webhookClientConfig?: WebhookClientConfig;
}
/**
 * CustomResourceDefinition represents a resource that should be exposed on the API server.  Its name MUST be in the format <.spec.name>.<.spec.group>. Deprecated in v1.16, planned for removal in v1.22. Use apiextensions.k8s.io/v1 CustomResourceDefinition instead.
 */
export interface CustomResourceDefinition {
    /**
     * APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
     */
    apiVersion?: "apiextensions.k8s.io/v1beta1";
    /**
     * Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
     */
    kind?: "CustomResourceDefinition";
    metadata?: ObjectMeta;
    /**
     * spec describes how the user wants the resources to appear
     */
    spec: CustomResourceDefinitionSpec;
    /**
     * status indicates the actual state of the CustomResourceDefinition
     */
    status?: CustomResourceDefinitionStatus;
}
/**
 * CustomResourceDefinitionCondition contains details for the current condition of this pod.
 */
export interface CustomResourceDefinitionCondition {
    /**
     * lastTransitionTime last time the condition transitioned from one status to another.
     */
    lastTransitionTime?: Time;
    /**
     * message is a human-readable message indicating details about last transition.
     */
    message?: string;
    /**
     * reason is a unique, one-word, CamelCase reason for the condition's last transition.
     */
    reason?: string;
    /**
     * status is the status of the condition. Can be True, False, Unknown.
     */
    status: string;
    /**
     * type is the type of the condition. Types include Established, NamesAccepted and Terminating.
     */
    type: string;
}
/**
 * CustomResourceDefinitionList is a list of CustomResourceDefinition objects.
 */
export interface CustomResourceDefinitionList {
    /**
     * APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
     */
    apiVersion?: "apiextensions.k8s.io/v1beta1";
    /**
     * items list individual CustomResourceDefinition objects
     */
    items: Array<CustomResourceDefinition>;
    /**
     * Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
     */
    kind?: "CustomResourceDefinitionList";
    metadata?: ListMeta;
}
/**
 * CustomResourceDefinitionNames indicates the names to serve this CustomResourceDefinition
 */
export interface CustomResourceDefinitionNames {
    /**
     * categories is a list of grouped resources this custom resource belongs to (e.g. 'all'). This is published in API discovery documents, and used by clients to support invocations like `kubectl get all`.
     */
    categories?: Array<string>;
    /**
     * kind is the serialized kind of the resource. It is normally CamelCase and singular. Custom resource instances will use this value as the `kind` attribute in API calls.
     */
    kind: string;
    /**
     * listKind is the serialized kind of the list for this resource. Defaults to "`kind`List".
     */
    listKind?: string;
    /**
     * plural is the plural name of the resource to serve. The custom resources are served under `/apis/<group>/<version>/.../<plural>`. Must match the name of the CustomResourceDefinition (in the form `<names.plural>.<group>`). Must be all lowercase.
     */
    plural: string;
    /**
     * shortNames are short names for the resource, exposed in API discovery documents, and used by clients to support invocations like `kubectl get <shortname>`. It must be all lowercase.
     */
    shortNames?: Array<string>;
    /**
     * singular is the singular name of the resource. It must be all lowercase. Defaults to lowercased `kind`.
     */
    singular?: string;
}
/**
 * CustomResourceDefinitionSpec describes how a user wants their resource to appear
 */
export interface CustomResourceDefinitionSpec {
    /**
     * additionalPrinterColumns specifies additional columns returned in Table output. See https://kubernetes.io/docs/reference/using-api/api-concepts/#receiving-resources-as-tables for details. If present, this field configures columns for all versions. Top-level and per-version columns are mutually exclusive. If no top-level or per-version columns are specified, a single column displaying the age of the custom resource is used.
     */
    additionalPrinterColumns?: Array<CustomResourceColumnDefinition>;
    /**
     * conversion defines conversion settings for the CRD.
     */
    conversion?: CustomResourceConversion;
    /**
     * group is the API group of the defined custom resource. The custom resources are served under `/apis/<group>/...`. Must match the name of the CustomResourceDefinition (in the form `<names.plural>.<group>`).
     */
    group: string;
    /**
     * names specify the resource and kind names for the custom resource.
     */
    names: CustomResourceDefinitionNames;
    /**
     * preserveUnknownFields indicates that object fields which are not specified in the OpenAPI schema should be preserved when persisting to storage. apiVersion, kind, metadata and known fields inside metadata are always preserved. If false, schemas must be defined for all versions. Defaults to true in v1beta for backwards compatibility. Deprecated: will be required to be false in v1. Preservation of unknown fields can be specified in the validation schema using the `x-kubernetes-preserve-unknown-fields: true` extension. See https://kubernetes.io/docs/tasks/access-kubernetes-api/custom-resources/custom-resource-definitions/#pruning-versus-preserving-unknown-fields for details.
     */
    preserveUnknownFields?: boolean;
    /**
     * scope indicates whether the defined custom resource is cluster- or namespace-scoped. Allowed values are `Cluster` and `Namespaced`. Default is `Namespaced`.
     */
    scope: string;
    /**
     * subresources specify what subresources the defined custom resource has. If present, this field configures subresources for all versions. Top-level and per-version subresources are mutually exclusive.
     */
    subresources?: CustomResourceSubresources;
    /**
     * validation describes the schema used for validation and pruning of the custom resource. If present, this validation schema is used to validate all versions. Top-level and per-version schemas are mutually exclusive.
     */
    validation?: CustomResourceValidation;
    /**
     * version is the API version of the defined custom resource. The custom resources are served under `/apis/<group>/<version>/...`. Must match the name of the first item in the `versions` list if `version` and `versions` are both specified. Optional if `versions` is specified. Deprecated: use `versions` instead.
     */
    version?: string;
    /**
     * versions is the list of all API versions of the defined custom resource. Optional if `version` is specified. The name of the first item in the `versions` list must match the `version` field if `version` and `versions` are both specified. Version names are used to compute the order in which served versions are listed in API discovery. If the version string is "kube-like", it will sort above non "kube-like" version strings, which are ordered lexicographically. "Kube-like" versions start with a "v", then are followed by a number (the major version), then optionally the string "alpha" or "beta" and another number (the minor version). These are sorted first by GA > beta > alpha (where GA is a version with no suffix such as beta or alpha), and then by comparing major version, then minor version. An example sorted list of versions: v10, v2, v1, v11beta2, v10beta3, v3beta1, v12alpha1, v11alpha2, foo1, foo10.
     */
    versions?: Array<CustomResourceDefinitionVersion>;
}
/**
 * CustomResourceDefinitionStatus indicates the state of the CustomResourceDefinition
 */
export interface CustomResourceDefinitionStatus {
    /**
     * acceptedNames are the names that are actually being used to serve discovery. They may be different than the names in spec.
     */
    acceptedNames?: CustomResourceDefinitionNames;
    /**
     * conditions indicate state for particular aspects of a CustomResourceDefinition
     */
    conditions?: Array<CustomResourceDefinitionCondition>;
    /**
     * storedVersions lists all versions of CustomResources that were ever persisted. Tracking these versions allows a migration path for stored versions in etcd. The field is mutable so a migration controller can finish a migration to another version (ensuring no old objects are left in storage), and then remove the rest of the versions from this list. Versions may not be removed from `spec.versions` while they exist in this list.
     */
    storedVersions?: Array<string>;
}
/**
 * CustomResourceDefinitionVersion describes a version for CRD.
 */
export interface CustomResourceDefinitionVersion {
    /**
     * additionalPrinterColumns specifies additional columns returned in Table output. See https://kubernetes.io/docs/reference/using-api/api-concepts/#receiving-resources-as-tables for details. Top-level and per-version columns are mutually exclusive. Per-version columns must not all be set to identical values (top-level columns should be used instead). If no top-level or per-version columns are specified, a single column displaying the age of the custom resource is used.
     */
    additionalPrinterColumns?: Array<CustomResourceColumnDefinition>;
    /**
     * deprecated indicates this version of the custom resource API is deprecated. When set to true, API requests to this version receive a warning header in the server response. Defaults to false.
     */
    deprecated?: boolean;
    /**
     * deprecationWarning overrides the default warning returned to API clients. May only be set when `deprecated` is true. The default warning indicates this version is deprecated and recommends use of the newest served version of equal or greater stability, if one exists.
     */
    deprecationWarning?: string;
    /**
     * name is the version name, e.g. “v1”, “v2beta1”, etc. The custom resources are served under this version at `/apis/<group>/<version>/...` if `served` is true.
     */
    name: string;
    /**
     * schema describes the schema used for validation and pruning of this version of the custom resource. Top-level and per-version schemas are mutually exclusive. Per-version schemas must not all be set to identical values (top-level validation schema should be used instead).
     */
    schema?: CustomResourceValidation;
    /**
     * served is a flag enabling/disabling this version from being served via REST APIs
     */
    served: boolean;
    /**
     * storage indicates this version should be used when persisting custom resources to storage. There must be exactly one version with storage=true.
     */
    storage: boolean;
    /**
     * subresources specify what subresources this version of the defined custom resource have. Top-level and per-version subresources are mutually exclusive. Per-version subresources must not all be set to identical values (top-level subresources should be used instead).
     */
    subresources?: CustomResourceSubresources;
}
/**
 * CustomResourceSubresourceScale defines how to serve the scale subresource for CustomResources.
 */
export interface CustomResourceSubresourceScale {
    /**
     * labelSelectorPath defines the JSON path inside of a custom resource that corresponds to Scale `status.selector`. Only JSON paths without the array notation are allowed. Must be a JSON Path under `.status` or `.spec`. Must be set to work with HorizontalPodAutoscaler. The field pointed by this JSON path must be a string field (not a complex selector struct) which contains a serialized label selector in string form. More info: https://kubernetes.io/docs/tasks/access-kubernetes-api/custom-resources/custom-resource-definitions#scale-subresource If there is no value under the given path in the custom resource, the `status.selector` value in the `/scale` subresource will default to the empty string.
     */
    labelSelectorPath?: string;
    /**
     * specReplicasPath defines the JSON path inside of a custom resource that corresponds to Scale `spec.replicas`. Only JSON paths without the array notation are allowed. Must be a JSON Path under `.spec`. If there is no value under the given path in the custom resource, the `/scale` subresource will return an error on GET.
     */
    specReplicasPath: string;
    /**
     * statusReplicasPath defines the JSON path inside of a custom resource that corresponds to Scale `status.replicas`. Only JSON paths without the array notation are allowed. Must be a JSON Path under `.status`. If there is no value under the given path in the custom resource, the `status.replicas` value in the `/scale` subresource will default to 0.
     */
    statusReplicasPath: string;
}
/**
 * CustomResourceSubresourceStatus defines how to serve the status subresource for CustomResources. Status is represented by the `.status` JSON path inside of a CustomResource. When set, * exposes a /status subresource for the custom resource * PUT requests to the /status subresource take a custom resource object, and ignore changes to anything except the status stanza * PUT/POST/PATCH requests to the custom resource ignore changes to the status stanza
 */
export interface CustomResourceSubresourceStatus {}
/**
 * CustomResourceSubresources defines the status and scale subresources for CustomResources.
 */
export interface CustomResourceSubresources {
    /**
     * scale indicates the custom resource should serve a `/scale` subresource that returns an `autoscaling/v1` Scale object.
     */
    scale?: CustomResourceSubresourceScale;
    /**
     * status indicates the custom resource should serve a `/status` subresource. When enabled: 1. requests to the custom resource primary endpoint ignore changes to the `status` stanza of the object. 2. requests to the custom resource `/status` subresource ignore changes to anything other than the `status` stanza of the object.
     */
    status?: CustomResourceSubresourceStatus;
}
/**
 * CustomResourceValidation is a list of validation methods for CustomResources.
 */
export interface CustomResourceValidation {
    /**
     * openAPIV3Schema is the OpenAPI v3 schema to use for validation and pruning.
     */
    openAPIV3Schema?: JSONSchemaProps;
}
/**
 * ExternalDocumentation allows referencing an external resource for extended documentation.
 */
export interface ExternalDocumentation {
    description?: string;
    url?: string;
}
/**
 * JSON represents any valid JSON value. These types are supported: bool, int64, float64, string, []interface{}, map[string]interface{} and nil.
 */
export interface JSON {}
/**
 * JSONSchemaProps is a JSON-Schema following Specification Draft 4 (http://json-schema.org/).
 */
export interface JSONSchemaProps {
    $ref?: string;
    $schema?: string;
    additionalItems?: JSONSchemaPropsOrBool;
    additionalProperties?: JSONSchemaPropsOrBool;
    allOf?: Array<JSONSchemaProps>;
    anyOf?: Array<JSONSchemaProps>;
    /**
     * default is a default value for undefined object fields. Defaulting is a beta feature under the CustomResourceDefaulting feature gate. CustomResourceDefinitions with defaults must be created using the v1 (or newer) CustomResourceDefinition API.
     */
    default?: JSON;
    definitions?: {
        [name: string]: JSONSchemaProps;
    };
    dependencies?: {
        [name: string]: JSONSchemaPropsOrStringArray;
    };
    description?: string;
    enum?: Array<JSON>;
    example?: JSON;
    exclusiveMaximum?: boolean;
    exclusiveMinimum?: boolean;
    externalDocs?: ExternalDocumentation;
    /**
     * format is an OpenAPI v3 format string. Unknown formats are ignored. The following formats are validated:
     *
     * - bsonobjectid: a bson object ID, i.e. a 24 characters hex string - uri: an URI as parsed by Golang net/url.ParseRequestURI - email: an email address as parsed by Golang net/mail.ParseAddress - hostname: a valid representation for an Internet host name, as defined by RFC 1034, section 3.1 [RFC1034]. - ipv4: an IPv4 IP as parsed by Golang net.ParseIP - ipv6: an IPv6 IP as parsed by Golang net.ParseIP - cidr: a CIDR as parsed by Golang net.ParseCIDR - mac: a MAC address as parsed by Golang net.ParseMAC - uuid: an UUID that allows uppercase defined by the regex (?i)^[0-9a-f]{8}-?[0-9a-f]{4}-?[0-9a-f]{4}-?[0-9a-f]{4}-?[0-9a-f]{12}$ - uuid3: an UUID3 that allows uppercase defined by the regex (?i)^[0-9a-f]{8}-?[0-9a-f]{4}-?3[0-9a-f]{3}-?[0-9a-f]{4}-?[0-9a-f]{12}$ - uuid4: an UUID4 that allows uppercase defined by the regex (?i)^[0-9a-f]{8}-?[0-9a-f]{4}-?4[0-9a-f]{3}-?[89ab][0-9a-f]{3}-?[0-9a-f]{12}$ - uuid5: an UUID5 that allows uppercase defined by the regex (?i)^[0-9a-f]{8}-?[0-9a-f]{4}-?5[0-9a-f]{3}-?[89ab][0-9a-f]{3}-?[0-9a-f]{12}$ - isbn: an ISBN10 or ISBN13 number string like "0321751043" or "978-0321751041" - isbn10: an ISBN10 number string like "0321751043" - isbn13: an ISBN13 number string like "978-0321751041" - creditcard: a credit card number defined by the regex ^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$ with any non digit characters mixed in - ssn: a U.S. social security number following the regex ^\d{3}[- ]?\d{2}[- ]?\d{4}$ - hexcolor: an hexadecimal color code like "#FFFFFF: following the regex ^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$ - rgbcolor: an RGB color code like rgb like "rgb(255,255,2559" - byte: base64 encoded binary data - password: any kind of string - date: a date string like "2006-01-02" as defined by full-date in RFC3339 - duration: a duration string like "22 ns" as parsed by Golang time.ParseDuration or compatible with Scala duration format - datetime: a date time string like "2014-12-15T19:30:20.000Z" as defined by date-time in RFC3339.
     */
    format?: string;
    id?: string;
    items?: JSONSchemaPropsOrArray;
    maxItems?: number;
    maxLength?: number;
    maxProperties?: number;
    maximum?: number;
    minItems?: number;
    minLength?: number;
    minProperties?: number;
    minimum?: number;
    multipleOf?: number;
    not?: JSONSchemaProps;
    nullable?: boolean;
    oneOf?: Array<JSONSchemaProps>;
    pattern?: string;
    patternProperties?: {
        [name: string]: JSONSchemaProps;
    };
    properties?: {
        [name: string]: JSONSchemaProps;
    };
    required?: Array<string>;
    title?: string;
    type?: string;
    uniqueItems?: boolean;
}
/**
 * JSONSchemaPropsOrArray represents a value that can either be a JSONSchemaProps or an array of JSONSchemaProps. Mainly here for serialization purposes.
 */
export declare type JSONSchemaPropsOrArray =
    | JSONSchemaProps
    | JSONSchemaProps[];
/**
 * JSONSchemaPropsOrBool represents JSONSchemaProps or a boolean value. Defaults to true for the boolean property.
 */
export declare type JSONSchemaPropsOrBool = JSONSchemaProps | boolean;
/**
 * JSONSchemaPropsOrStringArray represents a JSONSchemaProps or a string array.
 */
export declare type JSONSchemaPropsOrStringArray = JSONSchemaProps | string[];
/**
 * ServiceReference holds a reference to Service.legacy.k8s.io
 */
export interface ServiceReference {
    /**
     * name is the name of the service. Required
     */
    name: string;
    /**
     * namespace is the namespace of the service. Required
     */
    namespace: string;
    /**
     * path is an optional URL path at which the webhook will be contacted.
     */
    path?: string;
    /**
     * port is an optional service port at which the webhook will be contacted. `port` should be a valid port number (1-65535, inclusive). Defaults to 443 for backward compatibility.
     */
    port?: number;
}
/**
 * WebhookClientConfig contains the information to make a TLS connection with the webhook.
 */
export interface WebhookClientConfig {
    /**
     * caBundle is a PEM encoded CA bundle which will be used to validate the webhook's server certificate. If unspecified, system trust roots on the apiserver are used.
     */
    caBundle?: string;
    /**
     * service is a reference to the service for this webhook. Either service or url must be specified.
     *
     * If the webhook is running within the cluster, then you should use `service`.
     */
    service?: ServiceReference;
    /**
     * url gives the location of the webhook, in standard URL form (`scheme://host:port/path`). Exactly one of `url` or `service` must be specified.
     *
     * The `host` should not refer to a service running in the cluster; use the `service` field instead. The host might be resolved via external DNS in some apiservers (e.g., `kube-apiserver` cannot resolve in-cluster DNS as that would be a layering violation). `host` may also be an IP address.
     *
     * Please note that using `localhost` or `127.0.0.1` as a `host` is risky unless you take great care to run this webhook on all hosts which run an apiserver which might need to make calls to this webhook. Such installs are likely to be non-portable, i.e., not easy to turn up in a new cluster.
     *
     * The scheme must be "https"; the URL must begin with "https://".
     *
     * A path is optional, and if present may be any string permissible in a URL. You may use the path to pass an arbitrary string to the webhook, for example, a cluster identifier.
     *
     * Attempting to use a user or basic auth e.g. "user:password@" is not allowed. Fragments ("#...") and query parameters ("?...") are not allowed, either.
     */
    url?: string;
}
