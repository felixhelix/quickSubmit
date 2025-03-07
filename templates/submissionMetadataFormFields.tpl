{**
 * templates/submission/submissionMetadataFormFields.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Submission's metadata form fields.
 *}

{if $citationsEnabled && array_intersect(array(\PKP\security\Role::ROLE_ID_MANAGER, \PKP\security\Role::ROLE_ID_SUB_EDITOR, \PKP\security\Role::ROLE_ID_ASSISTANT, \PKP\security\Role::ROLE_ID_REVIEWER, \PKP\security\Role::ROLE_ID_AUTHOR), (array)$userRoles)}
	{assign var=citationsEnabled value=true}
{else}
	{assign var=citationsEnabled value=false}
{/if}

{if $coverageEnabled || $typeEnabled || $sourceEnabled || $rightsEnabled || $dataAvailabilityEnabled}
	{fbvFormArea id="additionalDublinCore" title="submission.metadata"}
		{fbvFormSection description="submission.metadataDescription"}

		{/fbvFormSection}
		{if $coverageEnabled}
			{fbvFormSection title="submission.coverage" for="coverage" required=$coverageRequired}
				{fbvElement type="text" multilingual=true name="coverage" id="coverage" value=$coverage maxlength="255" readonly=$readOnly required=false required=$coverageRequired}
			{/fbvFormSection}
		{/if}
		{if $typeEnabled}
			{fbvFormSection for="type" title="common.type" required=$typeRequired}
				{fbvElement type="text" label="submission.type.tip" multilingual=true name="type" id="type" value=$type maxlength="255" readonly=$readOnly required=$typeRequired}
			{/fbvFormSection}
		{/if}
		{if $sourceEnabled}
			{fbvFormSection label="submission.source" for="source" required=$sourceRequired}
				{fbvElement type="text" label="submission.source.tip" multilingual=true name="source" id="source" value=$source maxlength="255" readonly=$readOnly required=$sourceRequired}
			{/fbvFormSection}
		{/if}
		{if $rightsEnabled}
			{fbvFormSection label="submission.rights" for="rights" required=$rightsRequired}
				{fbvElement type="text" label="submission.rights.tip" multilingual=true name="rights" id="rights" value=$rights maxlength="255" readonly=$readOnly required=$rightsRequired}
			{/fbvFormSection}
		{/if}
		{if $dataAvailabilityEnabled}
			{fbvFormSection label="submission.dataAvailability" for="dataAvailability" required=$dataAvailabilityRequired}
				{fbvElement type="textarea" label="submission.dataAvailability.tip" multilingual=true name="dataAvailability" id="dataAvailability" value=$dataAvailability readonly=$readOnly required=$dataAvailabilityRequired}
			{/fbvFormSection}
		{/if}
	{/fbvFormArea}
{/if}

{if $languagesEnabled || $subjectsEnabled || $agenciesEnabled || $keywordsEnabled || $citationsEnabled || $disciplinesEnabled}
	{fbvFormArea id="tagitFields" title="submission.submit.metadataForm"}
		{if $languagesEnabled}
			{capture assign="sectionDescription"}{if !$readOnly}submission.submit.metadataForm.tip{/if}{/capture}
			{fbvFormSection description=$sectionDescription label="common.languages" required=$languagesRequired}
				{fbvElement type="keyword" id="languages" subLabelTranslate=true multilingual=true current=$languages sourceUrl=$languagesSourceUrl disabled=$readOnly}
			{/fbvFormSection}
		{/if}
		{if $subjectsEnabled}
			{fbvFormSection description="submission.submit.metadataForm.tip" label="common.subjects" required=$subjectsRequired}
				{fbvElement type="keyword" id="subjects" multilingual=true current=$subjects disabled=$readOnly required=$subjectsRequired sourceUrl=$subjectsSourceUrl}
			{/fbvFormSection}
		{/if}
		{if $disciplinesEnabled}
			{fbvFormSection description="submission.submit.metadataForm.tip" label="search.discipline" required=$disciplinesRequired}
				{fbvElement type="keyword" id="disciplines" multilingual=true current=$disciplines disabled=$readOnly required=$disciplinesRequired sourceUrl=$disciplinesSourceUrl}
			{/fbvFormSection}
		{/if}
		{if $keywordsEnabled}
			{fbvFormSection description="submission.submit.metadataForm.tip" label="common.keywords" required=$keywordsRequired}
				{fbvElement type="keyword" id="keywords" multilingual=true current=$keywords disabled=$readOnly required=$keywordsRequired sourceUrl=$keywordsSourceUrl}
			{/fbvFormSection}
		{/if}
		{if $agenciesEnabled}
			{fbvFormSection description="submission.submit.metadataForm.tip" label="submission.supportingAgencies" required=$agenciesRequired}
				{fbvElement type="keyword" id="agencies" multilingual=true current=$agencies disabled=$readOnly required=$agenciesRequired sourceUrl=$agenciesSourceUrl}
			{/fbvFormSection}
		{/if}
		{if $citationsEnabled}
			{fbvFormSection label="submission.citations" required=$citationsRequired}
				{fbvElement type="textarea" id="citationsRaw" value=$citationsRaw multilingual=false disabled=$readOnly required=$citationsRequired}
			{/fbvFormSection}
		{/if}
	{/fbvFormArea}
{/if}
