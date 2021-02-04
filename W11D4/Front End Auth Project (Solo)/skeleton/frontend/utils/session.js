// Part 1 - Session API Util
// vid link: https://vimeo.com/243262762
// password: go_video_go
// Total Time (all 10 vids): 1 hr 3 mins

export const postUser = user => (
    $.ajax({
        url: '/api/users',
        method: 'POST',
        data: { user }
    })
);

export const postSession = user => (
    $.ajax({
        url: '/api/session',
        method: 'POST',
        data: { user }
    })
);

export const deleteSession = () => (
    $.ajax({
        url: '/api/session',
        method: 'DELETE'
    })
);
