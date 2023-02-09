//Storage keys
const dkEmail = 'cyclicsoft_key_email';
const dkPass = 'cyclicsoft_key_pass';

//Start of Database =====>
const dkSubjects = 'subjects';
const dkSubjectTypeId = 0;

const dkLessons = 'lessons';
const dkLessonTypeId = dkSubjectTypeId + 1;

const dkNotes = 'notes';
const dkNoteTypeId = dkLessonTypeId + 1;

const dkIntros = 'intros';
const dkIntroTypeId = dkNoteTypeId + 1;

const dkProfiles = 'profiles';
const dkProfileTypeId = dkIntroTypeId + 1;
const dkProfilesFavourites = 'profiles_fav_notes';

const dkSettings = 'settings';
const dkSettingTypeId = dkProfileTypeId + 1;

const dkSections = 'sections';
const dkSectionTypeId = dkSettingTypeId + 1;

const dkFeedbacks = 'feedbacks';
const dkFeedbackTypeId = dkSectionTypeId + 1;

const dkNoteReq = 'note_req';
const dkNoteReqTypeId = dkFeedbackTypeId + 1;
//<===== End of Database